#!/usr/bin/env pwsh
# Setup adaptive architecture design
# Usage: ./setup-design.ps1 -Json

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

# Define the architecture document file path
$archDocFile = "${featureDir}/architecture.md"

# Create the architecture document file with adaptive template
$archContent = @'
# Adaptive Architecture Document

## Feature
[Feature name and brief description from spec]

## Architecture Overview
[High-level overview of the adaptive architecture]

## Adaptive Context Analysis

### Evolution Patterns
[Analysis of which requirements are likely to change]

### Adaptability Requirements
[Specific requirements for how the architecture should adapt]

### Change Impact Assessment
[How changes in requirements might affect the architecture]

## Flexible Architecture Design

### Adaptive Component Models
[Design of components with clear interfaces for evolution]

#### Component 1: [Name]
- **Purpose**: [Component purpose]
- **Interfaces**: [Clear interfaces that allow for modification]
- **Adaptability Features**: [How this component can evolve]
- **Dependencies**: [Dependencies and how they're managed]

#### Component 2: [Name]
- **Purpose**: [Component purpose]
- **Interfaces**: [Clear interfaces that allow for modification]
- **Adaptability Features**: [How this component can evolve]
- **Dependencies**: [Dependencies and how they're managed]

[Add more components as needed]

### Adaptive Interface Design
[Design of interfaces that can accommodate evolution]

#### API Interfaces
[Design of APIs that can evolve gracefully]

#### Data Interfaces
[Design of data schemas that can evolve]

#### Component Interfaces
[Design of interfaces between components]

### Feedback Mechanisms
[Design of monitoring and metrics systems]

#### Performance Metrics
[Metrics for measuring architectural performance]

#### Adaptability Metrics
[Metrics for measuring how well the architecture adapts]

#### User Feedback Collection
[How user feedback will be collected and used]

## Adaptive Contracts and Data Models

### Adaptive Data Models
[Design of data schemas that can accommodate change]

#### Entity 1: [Name]
- **Current Schema**: [Current schema definition]
- **Evolution Strategy**: [How this schema can evolve]
- **Migration Path**: [How to migrate between schema versions]

#### Entity 2: [Name]
- **Current Schema**: [Current schema definition]
- **Evolution Strategy**: [How this schema can evolve]
- **Migration Path**: [How to migrate between schema versions]

[Add more entities as needed]

### Adaptive API Contracts
[Design of APIs that can evolve gracefully]

#### API 1: [Name]
- **Current Contract**: [Current API definition]
- **Versioning Strategy**: [How this API will be versioned]
- **Evolution Path**: [How this API can evolve]
- **Backward Compatibility**: [How backward compatibility is maintained]

#### API 2: [Name]
- **Current Contract**: [Current API definition]
- **Versioning Strategy**: [How this API will be versioned]
- **Evolution Path**: [How this API can evolve]
- **Backward Compatibility**: [How backward compatibility is maintained]

[Add more APIs as needed]

## Evolution Strategies

### Gradual Evolution Plan
[How the architecture will evolve gradually over time]

### Adaptation Triggers
[Conditions that trigger architectural adaptation]

### Rollback Mechanisms
[How to rollback changes if needed]

## Implementation Constraints

### Technical Constraints
[Technical limitations that affect the architecture]

### Performance Requirements
[Performance needs that the architecture must meet]

### Security Requirements
[Security needs that the architecture must address]

## Quality Assurance for Adaptability

### Testing Strategy
[How adaptive elements will be tested]

### Validation Criteria
[Criteria for validating adaptive architecture]

### Monitoring Plan
[How the architecture will be monitored for adaptation needs]

## Risk Mitigation

### Adaptation Risks
[Risks related to architectural adaptation]

### Mitigation Strategies
[How these risks will be mitigated]

## Future Considerations

### Scalability Planning
[How the architecture will scale with changing needs]

### Technology Evolution
[How the architecture will adapt to changing technology]

### Integration Considerations
[How external integrations will be handled]

## Architecture Decision Records

### ADR 001: [Decision Title]
- **Status**: [Accepted/Superseded/Deprecated]
- **Context**: [Situation that led to the decision]
- **Decision**: [What was decided]
- **Consequences**: [Results of the decision]
- **Adaptation Note**: [How this decision might need to evolve]

[Add more ADRs as needed]

## Notes

[Any additional notes about the adaptive architecture]

'@

Set-Content -Path $archDocFile -Value $archContent -Encoding UTF8

# Define paths for other artifacts that will be created
$dataModelFile = "${featureDir}/data-model.md"
$contractsDir = "${featureDir}/contracts"
$quickstartFile = "${featureDir}/quickstart.md"

# Create placeholder files that will be filled in later
New-Item -Path $dataModelFile -ItemType File -Force | Out-Null
New-Item -Path $contractsDir -ItemType Directory -Force | Out-Null
New-Item -Path $quickstartFile -ItemType File -Force | Out-Null

# Output the result
if ($Json) {
    $result = @{
        FEATURE_SPEC = $specFile
        ARCHITECTURE_DOC = $archDocFile
        SPECS_DIR = $featureDir
        BRANCH = $branchName
        DATA_MODEL_FILE = $dataModelFile
        CONTRACTS_DIR = $contractsDir
        QUICKSTART_FILE = $quickstartFile
    }
    $result | ConvertTo-Json
} else {
    Write-Output "Created architecture document: $archDocFile"
    Write-Output "Feature spec: $specFile"
    Write-Output "Branch: $branchName"
    Write-Output "Data model: $dataModelFile"
    Write-Output "Contracts directory: $contractsDir"
    Write-Output "Quickstart guide: $quickstartFile"
}