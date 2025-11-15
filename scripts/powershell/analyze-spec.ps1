#!/usr/bin/env pwsh
# Analyze feature specification with adaptive reasoning chains
# Usage: ./analyze-spec.ps1 -Json

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

# Define the analysis report file path
$analysisFile = "${featureDir}/analysis-report.md"

# Create the analysis report file
$analysisContent = @'
# Adaptive Specification Analysis Report

## Feature
[Feature name and brief description from spec]

## Analysis Date
[Current date]

## Executive Summary
[Brief overview of analysis findings and adaptive recommendations]

## Cross-Artifact Consistency Analysis

### Consistency Issues Found
[List specific inconsistencies found between different parts of the specification]

### Impact Assessment
[Severity rating for each issue (High/Medium/Low)]

### Adaptive Suggestions
[Recommendations for making requirements more adaptable]

## Risk Assessment

### Technical Risks
[Identified technical risks with adaptive considerations]

### Business Risks
[Identified business risks with adaptive considerations]

### Evolution Risks
[Risks related to specification adaptability and evolution]

## Adaptive Improvement Recommendations

### Immediate Improvements
[Recommendations that should be implemented immediately]

### Adaptive Enhancement Suggestions
[Suggestions for making the specification more adaptable]

### Specification Refinement
[Specific recommendations to improve clarity and adaptability]

## Continuous Improvement Pathways

### Feedback Mechanisms
[Recommended approaches for collecting feedback about the specification]

### Evolution Triggers
[Conditions that would indicate when the specification needs updates]

### Monitoring Approaches
[How to track requirement effectiveness over time]

## Action Items

### Critical Issues (High Priority)
[Items that must be addressed immediately]

### Important Improvements (Medium Priority)  
[Items that should be addressed soon]

### Enhancement Suggestions (Low Priority)
[Items that could be addressed to improve adaptability]

## Adaptive Elements Validation

### Core Requirements
[Verification that core requirements are stable and well-defined]

### Flexible Areas
[Verification that flexible areas are properly identified for adjustment]

### Evolution Paths
[Verification that evolution paths are clearly defined]

## Recommendation Summary

### Priority Actions
[Top actions that should be taken based on analysis]

### Adaptive Design Considerations
[Key points to consider for adaptive design]

### Future Planning
[Recommendations for ongoing specification maintenance]

## Notes

[Additional notes about the analysis and recommendations]

'@

Set-Content -Path $analysisFile -Value $analysisContent -Encoding UTF8

# Output the result
if ($Json) {
    $result = @{
        FEATURE_SPEC = $specFile
        ANALYSIS_REPORT = $analysisFile
        SPECS_DIR = $featureDir
        BRANCH = $branchName
    }
    $result | ConvertTo-Json
} else {
    Write-Output "Created analysis report: $analysisFile"
    Write-Output "Analyzed spec: $specFile"
    Write-Output "Branch: $branchName"
}