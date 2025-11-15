#!/usr/bin/env pwsh
# Setup implementation plan with adaptive reasoning chains
# Usage: ./setup-plan.ps1 -Json

[CmdletBinding()]
param(
    [switch]$Json
)

# Dot-source common functions
$ScriptDir = Split-Path $MyInvocation.MyCommand.Path
. "$ScriptDir\common.ps1"

# Find the current feature branch and spec
$currentBranch = ""
try {
    $currentBranch = git branch --show-current 2>$null
} catch {
    # If git command fails, continue with empty string
}

$specFile = ""
$featureDir = ""
$branchName = ""

if ($currentBranch -and $currentBranch -match '^\d+-') {
    $branchName = $currentBranch
    $featureDir = "${DEFAULT_SPECS_DIR}/${currentBranch}"
    $specFile = "${featureDir}/spec.md"
} else {
    # Try to find the most recent feature branch
    $specDirs = Get-ChildItem -Path $DEFAULT_SPECS_DIR -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -match '^\d+-' }
    foreach ($dir in $specDirs) {
        $branchName = $dir.Name
        $featureDir = $dir.FullName
        $specFile = "${featureDir}/spec.md"
        if (Test-Path $specFile) {
            break
        }
    }
}

if (-not (Test-Path $specFile)) {
    if ($Json) {
        Write-Output "{}"
    } else {
        Write-Error "Error: No feature specification found in current branch or spec directories"
    }
    exit 1
}

# Define the implementation plan file path
$implPlanFile = "${featureDir}/plan.md"

# Create the implementation plan file with adaptive template
$planContent = @'
# Implementation Plan

## Feature
[Feature name and brief description from spec]

## Technical Context
[Technology stack, architecture patterns, and technical constraints]

### Current Approach
[Describe the current best approach based on research and requirements]

### Alternative Approaches Considered
[Document other approaches that were considered and why they were not chosen]

### Technology Stack
[Specific technologies, frameworks, libraries to be used]

## Constitution Check
[Verify that the plan aligns with project constitution and architectural principles]

### Article Compliance
- [ ] Adaptive Architecture Principle: [How the plan supports evolution]
- [ ] Test-First Development: [How tests will be written first]
- [ ] Library-First Development: [How features will be implemented as libraries]

## Phase -1: Pre-Implementation Gates
[Quality gates that must be passed before implementation begins]

### Simplicity Gate
- [ ] Using ≤3 projects/components?
- [ ] No over-engineering future needs?
- [ ] Minimal abstraction layers?

### Integration-First Gate  
- [ ] Contract tests defined before implementation?
- [ ] Real dependencies used instead of mocks where appropriate?
- [ ] End-to-end validation planned?

## Phase 0: Research & Preparation
[Research phase to resolve unknowns and prepare for implementation]

### Research Tasks
[Specific research tasks to be completed before implementation]

### Unknowns Resolution
[How identified unknowns from technical context will be resolved]

### Risk Assessment
[Identify and plan for potential risks in implementation]

## Phase 1: Design & Architecture
[Design phase to create architecture and contracts]

### Data Model Design
[Plan for data model implementation]

### API Contract Design
[Plan for API contract definition]

### Component Architecture
[Plan for component design and interactions]

### Adaptive Design Elements
[Elements designed to support future evolution]

## Phase 2: Implementation Planning
[Detailed planning for implementation]

### Task Breakdown
[High-level tasks to be performed]

### Implementation Order
[Order in which components will be implemented]

### Testing Strategy
[Plan for testing at different levels]

### Success Criteria Validation
[How success criteria from spec will be validated]

## Implementation Details
[More detailed implementation notes, to be expanded as needed]

### File Creation Order
1. Create `contracts/` with API specifications
2. Create test files in order: contract → integration → e2e → unit
3. Create source files to make tests pass
4. Add implementation details to `implementation-details/` subdirectory

## Adaptive Implementation Considerations
[Considerations for how implementation might need to evolve]

### Evolution Strategies
[How the implementation can adapt to changing requirements]

### Monitoring and Feedback
[How the implementation will provide feedback for future adaptations]

### Rollback Plans
[How to revert changes if needed]

## Complexity Tracking
[Justification for any complexity that exceeds constitutional principles]

## Next Steps
1. [ ] Complete research phase
2. [ ] Finalize design and contracts
3. [ ] Generate adaptive task chains with `/arckit.chain`
4. [ ] Execute implementation with `/arckit.implement`
5. [ ] Validate against success criteria

'@

Set-Content -Path $implPlanFile -Value $planContent -Encoding UTF8

# Define paths for other artifacts that will be created
$researchFile = "${featureDir}/research.md"
$dataModelFile = "${featureDir}/data-model.md"
$quickstartFile = "${featureDir}/quickstart.md"

# Create placeholder files that will be filled in later
New-Item -Path $researchFile -ItemType File -Force | Out-Null
New-Item -Path $dataModelFile -ItemType File -Force | Out-Null
New-Item -Path $quickstartFile -ItemType File -Force | Out-Null

# Output the result
if ($Json) {
    $result = @{
        FEATURE_SPEC = $specFile
        IMPL_PLAN = $implPlanFile
        SPECS_DIR = $featureDir
        BRANCH = $branchName
        RESEARCH_FILE = $researchFile
        DATA_MODEL_FILE = $dataModelFile
        QUICKSTART_FILE = $quickstartFile
    }
    $result | ConvertTo-Json
} else {
    Write-Output "Created implementation plan: $implPlanFile"
    Write-Output "Feature spec: $specFile"
    Write-Output "Branch: $branchName"
    Write-Output "Research file: $researchFile"
    Write-Output "Data model: $dataModelFile"
    Write-Output "Quickstart guide: $quickstartFile"
}