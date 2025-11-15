#!/usr/bin/env pwsh
# Create a new feature branch and specification file with adaptive reasoning chains
# Usage: ./create-new-feature.ps1 -Json [-Number N] [-ShortName name] -Arguments "feature description"
# Or: ./create-new-feature.ps1 -Json -Arguments "feature description" (auto-numbering)

[CmdletBinding()]
param(
    [switch]$Json,
    [int]$Number,
    [string]$ShortName,
    [string]$Arguments
)

# Dot-source common functions
$ScriptDir = Split-Path $MyInvocation.MyCommand.Path
. "$ScriptDir\common.ps1"

# Validate inputs
if (-not $Arguments) {
    if ($Json) {
        Write-Output "{}"
    } else {
        Write-Error "Error: Feature description is required"
    }
    exit 1
}

# If number or short name are not provided, calculate them
if (-not $Number -or -not $ShortName) {
    if (-not $ShortName) {
        $ShortName = New-BranchName -Description $Arguments
    }
    
    if (-not $Number) {
        $Number = Get-NextFeatureNumber -FeatureName $ShortName
    }
}

# Ensure we're in a git repository
Test-GitRepo

# Initialize the spec directory
$resultJson = Initialize-SpecDirectory -Number $Number -ShortName $ShortName -Description $Arguments

# Extract values from JSON result
$resultObj = $resultJson | ConvertFrom-Json
$branchName = $resultObj.BRANCH_NAME
$specFile = $resultObj.SPEC_FILE

# Create the branch
Set-GitBranch -BranchName $branchName

# Create the initial spec file with adaptive template
$specContent = @'
# Feature Specification

## Feature Name
[Feature name based on description]

## Overview
[Provide a brief overview of the feature and its purpose]

## User Scenarios
[Describe the user scenarios that this feature addresses]

### Scenario 1
[Detailed description of first user scenario]

### Scenario 2
[Detailed description of second user scenario]

[Add more scenarios as needed]

## Functional Requirements
[Specific, testable requirements for the feature]

1. [Requirement 1 - should be testable and specific]
2. [Requirement 2 - should be testable and specific]
3. [Requirement 3 - should be testable and specific]

[Add more requirements as needed]

## Non-Functional Requirements
[Performance, security, and other non-functional requirements]

- [Performance requirement]
- [Security requirement]
- [Other non-functional requirement]

## Success Criteria
[Measurable outcomes that indicate the feature is successful]

- [Quantitative metric 1]
- [Quantitative metric 2]
- [Qualitative measure 1]

## Key Entities
[Important data entities or objects related to this feature]

- [Entity 1]: [Description]
- [Entity 2]: [Description]

[Add more entities as needed]

## Assumptions
[Document any assumptions made during specification]

- [Assumption 1]
- [Assumption 2]

## Dependencies
[External dependencies or requirements]

- [Dependency 1]
- [Dependency 2]

## Adaptive Elements
[Elements that may need to evolve based on feedback or changing requirements]

- [Adaptive element 1]: [How this might evolve]
- [Adaptive element 2]: [How this might evolve]

[Add more adaptive elements as needed]

## Evolution Triggers
[Conditions that would prompt specification updates]

- [Trigger 1]
- [Trigger 2]

## Open Questions
[Questions that need to be answered before implementation]

- [Question 1]
- [Question 2]

## Notes
[Any additional notes or considerations]

'@

Set-Content -Path $specFile -Value $specContent -Encoding UTF8

# Ensure the constitution exists
Confirm-ConstitutionExists

# Ensure the arckit structure exists
Confirm-ArcKitStructure

# Output the result
if ($Json) {
    $resultObj.PSObject.Properties.Add([PSCustomObject]@{Name='SPEC_FILE'; Value=$specFile})
    $resultObj.PSObject.Properties.Add([PSCustomObject]@{Name='BRANCH_NAME'; Value=$branchName})
    $resultObj.PSObject.Properties.Add([PSCustomObject]@{Name='FEATURE_DIR'; Value=(Split-Path $specFile -Parent)})
    $resultObj.PSObject.Properties.Add([PSCustomObject]@{Name='CHECKLIST_FILE'; Value="$(Split-Path $specFile -Parent)/checklists/adaptive-requirements.md"})
    
    $resultObj | ConvertTo-Json
} else {
    Write-Output "Created feature branch: $branchName"
    Write-Output "Specification file: $specFile"
    Write-Output "Feature directory: $(Split-Path $specFile -Parent)"
}