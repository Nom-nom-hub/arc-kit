#!/usr/bin/env bash
# /// script
# requires-python = false
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

**Feature**: [Feature name and brief description from spec]
**Analysis Date**: [Current date]
**Spec File**: [Reference to the analyzed spec file]
**Evolution Context**: [Reference to evolution pathways and adaptation strategies from analysis]

## Executive Summary

[Brief overview of analysis findings and comprehensive adaptive recommendations with evolution planning]

## Adaptive Specification Quality Assessment

### Adaptive Requirements Analysis
- **Adaptability Rating**: [Rating of how well requirements support adaptation]
- **Evolution Readiness**: [Rating of how ready requirements are for evolution]
- **Context Awareness**: [Assessment of how well requirements account for different contexts]

### User Story Independence Verification
- **P1 User Story**: [Verification that P1 story is independently implementable and testable]
- **P2 User Story**: [Verification that P2 story is independently implementable and testable]
- **P3 User Story**: [Verification that P3 story is independently implementable and testable]

### Evolution Scenario Validation
- **Scenario 1**: [Validation of evolution scenario 1 from spec]
- **Scenario 2**: [Validation of evolution scenario 2 from spec]
- **Scenario 3**: [Validation of evolution scenario 3 from spec]

## Cross-Artifact Consistency Analysis with Evolution

### Consistency Issues Found with Evolution Impact
- **Issue 1**: [Specific inconsistency found between different parts of the specification] - Impact: [Low/Medium/High] on evolution path
- **Issue 2**: [Specific inconsistency found between different parts of the specification] - Impact: [Low/Medium/High] on evolution path
- **Issue 3**: [Specific inconsistency found between different parts of the specification] - Impact: [Low/Medium/High] on evolution path

### Impact Assessment by Evolution Stage
- **Short-term Evolution (0-6 months)**: [Issues that impact near-term evolution]
- **Medium-term Evolution (6-18 months)**: [Issues that impact medium-term evolution]
- **Long-term Evolution (18+ months)**: [Issues that impact long-term evolution]

### Adaptive Suggestions with Implementation Strategy
- **Suggestion 1**: [Recommendation for making requirements more adaptable] - Strategy: [How to implement this suggestion]
- **Suggestion 2**: [Recommendation for making requirements more adaptable] - Strategy: [How to implement this suggestion]
- **Suggestion 3**: [Recommendation for making requirements more adaptable] - Strategy: [How to implement this suggestion]

## Adaptive Risk Assessment with Context Awareness

### Technical Risks with Context Considerations
- **Risk 1**: [Identified technical risk with adaptive considerations] - Context Impact: [How this affects different contexts]
- **Risk 2**: [Identified technical risk with adaptive considerations] - Context Impact: [How this affects different contexts]

### Business Risks with Evolution Planning
- **Risk 1**: [Identified business risk with adaptive considerations] - Evolution Impact: [How this affects evolution planning]
- **Risk 2**: [Identified business risk with adaptive considerations] - Evolution Impact: [How this affects evolution planning]

### Evolution Risks with Backward Compatibility
- **Risk 1**: [Risk related to specification adaptability and evolution] - Backward Compatibility: [How this affects existing functionality]
- **Risk 2**: [Risk related to specification adaptability and evolution] - Backward Compatibility: [How this affects existing functionality]

## Adaptive Improvement Recommendations with Reasoning Chains

### Immediate Improvements for Evolution Readiness
- **Improvement 1**: [Recommendation that should be implemented immediately] - Reasoning: [Why this is important for adaptation]
- **Improvement 2**: [Recommendation that should be implemented immediately] - Reasoning: [Why this is important for adaptation]

### Adaptive Enhancement Suggestions with Context Validation
- **Enhancement 1**: [Suggestions for making the specification more adaptable] - Context Validation: [How to validate this across contexts]
- **Enhancement 2**: [Suggestions for making the specification more adaptable] - Context Validation: [How to validate this across contexts]

### Specification Refinement with Learning Integration
- **Refinement 1**: [Specific recommendations to improve clarity and adaptability] - Learning Integration: [How to incorporate feedback]
- **Refinement 2**: [Specific recommendations to improve clarity and adaptability] - Learning Integration: [How to incorporate feedback]

## Adaptive Continuous Improvement Pathways

### Feedback Integration Mechanisms
- **User Feedback**: [Recommended approaches for collecting user feedback about the specification]
- **System Feedback**: [Recommended approaches for collecting system feedback about implementation]
- **Context Feedback**: [Recommended approaches for collecting context-specific feedback]

### Evolution Trigger Identification
- **Performance Triggers**: [Conditions related to performance that would indicate when the specification needs updates]
- **Usage Triggers**: [Conditions related to usage patterns that would indicate when the specification needs updates]
- **Context Triggers**: [Conditions related to context changes that would indicate when the specification needs updates]

### Adaptive Monitoring Approaches
- **Adaptation Effectiveness**: [How to track adaptation effectiveness over time]
- **Evolution Success**: [How to track evolution success metrics]
- **Context Performance**: [How to track performance across different contexts]

## Adaptive Action Items with Evolution Planning

### Critical Issues (High Priority) - Blocking Evolution
- **Issue 1**: [Items that must be addressed immediately] - Evolution Impact: [How this blocks evolution]
- **Issue 2**: [Items that must be addressed immediately] - Evolution Impact: [How this blocks evolution]

### Important Improvements (Medium Priority) - Enhancement for Evolution
- **Improvement 1**: [Items that should be addressed soon] - Evolution Enhancement: [How this helps evolution]
- **Improvement 2**: [Items that should be addressed soon] - Evolution Enhancement: [How this helps evolution]

### Enhancement Suggestions (Low Priority) - Optional Evolution Improvements
- **Suggestion 1**: [Items that could be addressed to improve adaptability] - Evolution Value: [Potential evolution value]
- **Suggestion 2**: [Items that could be addressed to improve adaptability] - Evolution Value: [Potential evolution value]

## Adaptive Elements Validation with Schema Evolution

### Core Requirements Stability
- **Stable Requirement 1**: [Verification that core requirement is stable and well-defined] - Evolution Path: [How this might evolve safely]
- **Stable Requirement 2**: [Verification that core requirement is stable and well-defined] - Evolution Path: [How this might evolve safely]

### Flexible Areas Properly Identified
- **Flexible Area 1**: [Verification that flexible area is properly identified for adjustment] - Adaptation Strategy: [How this area adapts]
- **Flexible Area 2**: [Verification that flexible area is properly identified for adjustment] - Adaptation Strategy: [How this area adapts]

### Schema Evolution Validation
- **Entity 1**: [Verification that schema evolution paths are clearly defined] - Migration Path: [How to migrate this entity]
- **Entity 2**: [Verification that schema evolution paths are clearly defined] - Migration Path: [How to migrate this entity]

## Adaptive Recommendation Summary with Strategic Planning

### Priority Actions for Immediate Evolution
- **Action 1**: [Top actions that should be taken based on analysis] - Priority: [High/Medium/Low]
- **Action 2**: [Top actions that should be taken based on analysis] - Priority: [High/Medium/Low]

### Adaptive Design Considerations with Architecture Impact
- **Consideration 1**: [Key points to consider for adaptive design] - Architecture Impact: [How this affects overall architecture]
- **Consideration 2**: [Key points to consider for adaptive design] - Architecture Impact: [How this affects overall architecture]

### Future Evolution Planning
- **Short-term Plan**: [Recommendations for ongoing specification maintenance (0-6 months)]
- **Medium-term Plan**: [Recommendations for ongoing specification maintenance (6-18 months)]
- **Long-term Plan**: [Recommendations for ongoing specification maintenance (18+ months)]

## Adaptive Context Validation

### Context A Validation
- **Requirements**: [How requirements work in Context A]
- **Adaptation**: [How adaptation works in Context A]
- **Validation**: [How to validate in Context A]

### Context B Validation
- **Requirements**: [How requirements work in Context B]
- **Adaptation**: [How adaptation works in Context B]
- **Validation**: [How to validate in Context B]

### Context C Validation
- **Requirements**: [How requirements work in Context C]
- **Adaptation**: [How adaptation works in Context C]
- **Validation**: [How to validate in Context C]

## Adaptive Quality Gate Checklists

### Specification Completeness
- [ ] All user stories have clear acceptance scenarios
- [ ] All requirements have measurable success criteria
- [ ] All entities have complete definitions
- [ ] All evolution scenarios are properly documented
- [ ] Context switching requirements are specified
- [ ] Backward compatibility requirements are defined

### Adaptation Readiness
- [ ] Requirements specify how to adapt to context changes
- [ ] Success criteria include adaptation effectiveness
- [ ] Risk mitigation strategies are defined for key areas
- [ ] Feedback mechanisms are integrated into design
- [ ] Learning mechanisms are planned
- [ ] Schema evolution strategies are defined

### Evolution Planning
- [ ] Short-term evolution paths are defined
- [ ] Medium-term evolution paths are defined
- [ ] Long-term evolution paths are defined
- [ ] Backward compatibility strategies are defined
- [ ] Migration strategies are planned
- [ ] Rollback strategies are available

## Reasoning Chain Documentation

### Decision Traceability
- **Decision 1**: [Why this decision was made based on analysis] - Evidence: [What evidence supports this]
- **Decision 2**: [Why this decision was made based on analysis] - Evidence: [What evidence supports this]

### Learning Opportunities
- **Opportunity 1**: [How to improve analysis process based on this experience]
- **Opportunity 2**: [How to improve analysis process based on this experience]

## Notes

[Additional notes about the analysis and recommendations with evolution considerations and context-specific observations]

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