# Common functions and utilities for Arc Kit PowerShell scripts
# This file is dot-sourced by other scripts to provide shared functionality

# Default values
$DEFAULT_SPECS_DIR = ".arc/specs"
$DEFAULT_MEMORY_DIR = ".arc/memory"
$DEFAULT_SPECIFY_DIR = ".arc"

# Function to get the next feature number based on existing branches and spec directories
function Get-NextFeatureNumber {
    param([string]$FeatureName)
    
    # Sanitize the feature name
    $sanitizedName = $FeatureName -replace '[^a-zA-Z0-9-]', '-' -replace '--+', '-' -replace '(^-$)|(-$)', '' -replace '([A-Z])', { $_.ToString().ToLower() }
    
    # Find the highest number across remote branches, local branches, and spec directories
    $maxNumber = 0
    
    # Check if we're in a git repository
    if (Get-Command git -ErrorAction SilentlyContinue) {
        try {
            # Fetch remote branches
            git fetch --all --prune 2>$null | Out-Null
        } catch {
            # If fetch fails, continue with existing information
        }
        
        # Check remote branches
        try {
            $remoteBranches = git ls-remote --heads origin 2>$null | Out-String
            if ($remoteBranches) {
                $remoteNumbers = [regex]::Matches($remoteBranches, "\d+-$([regex]::Escape($sanitizedName))`$") | ForEach-Object { [int]($_.Value -replace "-$([regex]::Escape($sanitizedName))`$", "") }
                foreach ($num in $remoteNumbers) {
                    if ($num -gt $maxNumber) { $maxNumber = $num }
                }
            }
        } catch {
            # If git command fails, continue with other checks
        }
        
        # Check local branches
        try {
            $localBranches = git branch 2>$null | Out-String
            if ($localBranches) {
                $localNumbers = [regex]::Matches($localBranches, "^\s*\*?\s*(\d+)-$([regex]::Escape($sanitizedName))\s*$", [System.Text.RegularExpressions.RegexOptions]::Multiline) | ForEach-Object { [int]$_.Groups[1].Value }
                foreach ($num in $localNumbers) {
                    if ($num -gt $maxNumber) { $maxNumber = $num }
                }
            }
        } catch {
            # If git command fails, continue with other checks
        }
    }
    
    # Check spec directories
    if (Test-Path $DEFAULT_SPECS_DIR) {
        $specDirectories = Get-ChildItem -Path $DEFAULT_SPECS_DIR -Directory | Where-Object { $_.Name -match "^\d+-$([regex]::Escape($sanitizedName))`$" }
        foreach ($dir in $specDirectories) {
            $num = [int]($dir.Name -replace "-$([regex]::Escape($sanitizedName))`$", "")
            if ($num -gt $maxNumber) { $maxNumber = $num }
        }
    }
    
    # Return the next number
    return $maxNumber + 1
}

# Function to create a branch name from a feature description
function New-BranchName {
    param([string]$Description)
    
    # Extract key terms, convert to lowercase, replace spaces with hyphens
    return $Description -replace '[^a-zA-Z0-9 ]', ' ' -replace '  +', ' ' -replace '^ *| *$', '' -replace ' ', '-' -replace '([A-Z])', { $_.ToString().ToLower() }
}

# Function to create the specs directory structure and initialize files
function Initialize-SpecDirectory {
    param(
        [int]$Number,
        [string]$ShortName,
        [string]$Description
    )
    
    $branchName = "${Number}-${ShortName}"
    $specDir = "${DEFAULT_SPECS_DIR}/${branchName}"
    
    # Create the spec directory
    New-Item -ItemType Directory -Path $specDir -Force | Out-Null
    
    # Create subdirectories
    New-Item -ItemType Directory -Path "${specDir}/contracts" -Force | Out-Null
    New-Item -ItemType Directory -Path "${specDir}/implementation-details" -Force | Out-Null
    New-Item -ItemType Directory -Path "${specDir}/checklists" -Force | Out-Null
    
    # Return JSON with branch name and spec file path
    return @{
        BRANCH_NAME = $branchName
        SPEC_FILE = "${specDir}/spec.md"
        FEATURE_DIR = $specDir
        NUMBER = $Number
        SHORT_NAME = $ShortName
    } | ConvertTo-Json
}

# Function to validate if we're in a git repository
function Test-GitRepo {
    if (!(Get-Command git -ErrorAction SilentlyContinue) -or !(Test-Path .git)) {
        Write-Error "Error: Not in a git repository"
        exit 1
    }
}

# Function to checkout or create a git branch
function Set-GitBranch {
    param([string]$BranchName)
    
    # Fetch latest remote branches
    git fetch --all --prune 2>$null | Out-Null
    
    # Check if branch exists locally or remotely
    $localExists = $false
    $remoteExists = $false
    
    try {
        $localBranches = git branch 2>$null | Out-String
        $localExists = $localBranches -match [regex]::Escape($BranchName)
    } catch {}
    
    try {
        $remoteCheck = git ls-remote origin $BranchName 2>$null | Out-String
        $remoteExists = $remoteCheck -ne ""
    } catch {}
    
    if ($localExists -or $remoteExists) {
        # Branch exists, try to checkout
        try {
            git checkout $BranchName 2>$null | Out-Null
        } catch {
            # If local checkout fails, try pulling from remote
            if ($remoteExists) {
                try {
                    git checkout -b $BranchName "origin/$BranchName" 2>$null | Out-Null
                } catch {
                    git checkout $BranchName 2>$null | Out-Null
                }
            }
        }
    } else {
        # Branch doesn't exist, create new one
        $mainBranch = "main"
        try {
            $showResult = git remote show origin 2>$null | Out-String
            if ($showResult -match 'HEAD branch:\s*(\S+)') {
                $mainBranch = $matches[1]
            }
        } catch {}
        
        try {
            git checkout -b $BranchName "origin/$mainBranch" 2>$null | Out-Null
        } catch {
            try {
                git checkout -b $BranchName 2>$null | Out-Null
            } catch {
                try {
                    git checkout -b $BranchName $mainBranch 2>$null | Out-Null
                } catch {
                    git checkout -b $BranchName master 2>$null | Out-Null
                }
            }
        }
    }
}

# Function to create or update the constitution file
function Confirm-ConstitutionExists {
    # Ensure the arc structure exists first
    Confirm-ArcStructure

    $constitutionPath = "${DEFAULT_MEMORY_DIR}/constitution.md"

    if (!(Test-Path $constitutionPath)) {
        $constitutionDir = Split-Path $constitutionPath -Parent
        New-Item -ItemType Directory -Path $constitutionDir -Force | Out-Null

        $constitutionContent = @'
# Adaptive Project Constitution

**Version**: 2.0
**Created**: [DATE]
**Last Updated**: [DATE]
**Evolution Plan**: [Path to evolution scenarios and adaptation strategies]
**Context Dependencies**: [Environments and contexts this constitution must support]

## Purpose

This constitution establishes the governance principles for the adaptive project development team. These principles guide decision-making and ensure consistency across all development activities with sophisticated adaptation mechanisms, evolution planning, and context awareness integrated throughout.

## Core Adaptive Principles

### Article I: Advanced Adaptive Architecture Principle
- All system components must be designed for independent evolution across multiple contexts
- Changes should be gradual, safe, and reversible with rollback mechanisms
- Interfaces should be versioned, backward-compatible, and context-aware with intelligent adaptation
- Architecture should accommodate changing requirements with learning mechanisms
- Components must support dynamic configuration and context switching
- Evolution pathways must be planned and validated before implementation

### Article II: Adaptive Test-First Development with Learning
- All implementation must follow strict Test-Driven Development with evolution scenarios
- Unit tests must be written before implementation code with context variations
- Tests must be validated and approved before implementation begins with adaptation verification
- All tests must initially fail (Red phase) before implementation across all contexts
- Tests must include evolution scenario validation and feedback mechanism verification
- Context-switching tests must validate seamless transitions

### Article III: Adaptive Library-First Development with Context Isolation
- Every feature must begin as a standalone, context-aware library
- No feature should be implemented directly in application code without first being abstracted
- Libraries should have clear boundaries, minimal dependencies, and cross-context compatibility
- All functionality should be accessible through well-defined, adaptive interfaces
- Libraries must support evolution with backward compatibility mechanisms
- Context adapters must be designed as separate components

### Article IV: Continuous Learning & Reasoning Chain Integration
- All decisions must be documented with reasoning chains linking to outcomes
- Learning mechanisms must be built into every component to improve adaptation
- Feedback loops must connect implementation effectiveness to design decisions
- Evolution impact must be traced from requirements to implementation
- Context-specific adaptation effectiveness must be continuously measured
- Knowledge gained must inform future architectural decisions

### Article V: Evolution-Ready Development
- All code must be designed with evolution pathways in mind
- Schema migration strategies must be planned before implementation
- Backward compatibility must be maintained during evolution
- Evolution scenarios must be tested before changes are implemented
- Rollback strategies must be designed before forward evolution
- Cross-component evolution dependencies must be managed systematically

## Advanced Development Guidelines

### Adaptive Implementation Requirements
- [ ] All code must have corresponding cross-context tests
- [ ] New features must be implemented as context-aware libraries first
- [ ] All external interfaces must be versioned and backward-compatible
- [ ] Error handling must be comprehensive and context-adaptive with intelligent fallbacks
- [ ] Context switching mechanisms must be seamless and state-preserving
- [ ] Adaptation effectiveness metrics must be implemented and monitored
- [ ] Reasoning chains must link all decisions to outcomes with evolution impact

### Adaptive Quality Standards
- [ ] Code must pass all existing tests across all contexts
- [ ] New tests must achieve 80%+ coverage including evolution scenarios
- [ ] Performance requirements must be met with context switching overhead accounted for
- [ ] Security standards must be maintained across all contexts
- [ ] Adaptation effectiveness must be measured and validated
- [ ] Evolution readiness must be verified for all components
- [ ] Context isolation must prevent cross-contamination

### Adaptive Evolution Requirements
- [ ] Schema evolution strategies must be defined for all data components
- [ ] Migration paths must be tested and validated before implementation
- [ ] Backward compatibility layers must be implemented where needed
- [ ] Evolution scenarios must be tested with real data and contexts
- [ ] Rollback mechanisms must be validated across all contexts
- [ ] Cross-component evolution dependencies must be managed

## Adaptive Architecture Standards

### Context Management
- [ ] Context detection mechanisms must be reliable and fast
- [ ] Context-specific configurations must be isolated and manageable
- [ ] Cross-context data consistency must be maintained
- [ ] Context switching must be transparent to end users
- [ ] Context-specific performance requirements must be met

### Adaptation Mechanisms
- [ ] Adaptation logic must be separate from core business logic
- [ ] Learning algorithms must improve adaptation over time
- [ ] Feedback integration must be real-time and reliable
- [ ] Adaptation effectiveness must be continuously measured
- [ ] Fallback mechanisms must be available for failed adaptations

### Evolution Management
- [ ] Evolution pathways must be planned before implementation
- [ ] Migration strategies must be tested with real data
- [ ] Backward compatibility must be verified for all changes
- [ ] Evolution impact analysis must be performed for all changes
- [ ] Rollback procedures must be documented and tested

## Change Process with Learning Integration

This constitution may be updated as the team learns and evolves. Changes should be made thoughtfully with team input, clear justification, and consideration for evolution pathways. All changes must follow the same adaptive principles and include:

- Reasoning chains connecting the change to business outcomes
- Evolution scenarios for how the change might need to adapt
- Context impact analysis across all target environments
- Backward compatibility strategies
- Testing requirements including evolution scenarios
- Rollback procedures for the constitutional change

Updates to this constitution must be validated across all contexts and evolution scenarios before implementation.

'@

        Set-Content -Path $constitutionPath -Value $constitutionContent -Encoding UTF8
    }
}

# Function to create or update the .arc directory structure
function Confirm-ArcStructure {
    New-Item -ItemType Directory -Path "${DEFAULT_SPECIFY_DIR}/scripts" -Force | Out-Null
    New-Item -ItemType Directory -Path "${DEFAULT_SPECIFY_DIR}/templates" -Force | Out-Null
    New-Item -ItemType Directory -Path "${DEFAULT_SPECIFY_DIR}/memory" -Force | Out-Null
}