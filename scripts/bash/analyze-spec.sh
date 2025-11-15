#!/usr/bin/env bash
# /// script
# depends = ["jq"]
# ///

# Analyze feature specification with adaptive reasoning chains
# Usage: ./analyze-spec.sh --json

set -euo pipefail

# Source common functions
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Parse command line arguments
json_output=false
while [[ $# -gt 0 ]]; do
    case $1 in
        --json)
            json_output=true
            shift
            ;;
        *)
            echo "Unknown option: $1" >&2
            exit 1
            ;;
    esac
done

# Find the current feature branch and spec
current_branch=$(git branch --show-current 2>/dev/null || echo "")
spec_file=""
feature_dir=""
branch_name=""

if [[ -n "$current_branch" ]] && [[ "$current_branch" =~ ^[0-9]+- ]]; then
    branch_name="$current_branch"
    feature_dir="${DEFAULT_SPECS_DIR}/${current_branch}"
    spec_file="${feature_dir}/spec.md"
else
    # Try to find the most recent feature branch
    for dir in "${DEFAULT_SPECS_DIR}"/*; do
        if [[ -d "$dir" ]] && [[ "$(basename "$dir")" =~ ^[0-9]+- ]]; then
            branch_name=$(basename "$dir")
            feature_dir="$dir"
            spec_file="${dir}/spec.md"
            break
        fi
    done
fi

if [[ ! -f "$spec_file" ]]; then
    if [[ "$json_output" == true ]]; then
        echo "{}"
    else
        echo "Error: No feature specification found in current branch or spec directories" >&2
    fi
    exit 1
fi

# Define the analysis report file path
analysis_file="${feature_dir}/analysis-report.md"

# Create the analysis report file
cat > "$analysis_file" << 'EOF'
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

EOF

# Output the result
if [[ "$json_output" == true ]]; then
    echo "{
        \"FEATURE_SPEC\": \"$spec_file\",
        \"ANALYSIS_REPORT\": \"$analysis_file\",
        \"SPECS_DIR\": \"$feature_dir\",
        \"BRANCH\": \"$branch_name\"
    }" | jq .
else
    echo "Created analysis report: $analysis_file"
    echo "Analyzed spec: $spec_file"
    echo "Branch: $branch_name"
fi