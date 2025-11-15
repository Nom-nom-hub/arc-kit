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
# Project Constitution

**Version**: 1.0
**Created**: [DATE]

## Purpose

This constitution establishes the governance principles for the project development team. These principles guide decision-making and ensure consistency across all development activities.

## Core Principles

### Article I: Adaptive Architecture Principle
- All system components must be designed for evolution
- Changes should be gradual and safe
- Interfaces should be versioned and backward-compatible
- Architecture should accommodate changing requirements

### Article II: Test-First Development
- All implementation must follow strict Test-Driven Development
- Unit tests must be written before implementation code
- Tests must be validated and approved before implementation begins
- All tests must initially fail (Red phase) before implementation

### Article III: Library-First Development
- Every feature must begin as a standalone library
- No feature should be implemented directly in application code without first being abstracted
- Libraries should have clear boundaries and minimal dependencies
- All functionality should be accessible through well-defined interfaces

## Development Guidelines

### Implementation Requirements
- [ ] All code must have corresponding tests
- [ ] New features must be implemented as libraries first
- [ ] All external interfaces must be well documented
- [ ] Error handling must be comprehensive and user-friendly

### Quality Standards
- [ ] Code must pass all existing tests
- [ ] New tests must achieve 80%+ coverage
- [ ] Performance requirements must be met
- [ ] Security standards must be maintained

## Change Process

This constitution may be updated as the team learns and evolves. Changes should be made thoughtfully with team input and clear justification.

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