#!/usr/bin/env bash
# /// script
# depends = ["jq"]
# ///

# Setup implementation plan with adaptive reasoning chains
# Usage: ./setup-plan.sh --json

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

# Define the implementation plan file path
impl_plan_file="${feature_dir}/plan.md"

# Create the implementation plan file with adaptive template
cat > "$impl_plan_file" << 'EOF'
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

EOF

# Define paths for other artifacts that will be created
research_file="${feature_dir}/research.md"
data_model_file="${feature_dir}/data-model.md"
quickstart_file="${feature_dir}/quickstart.md"

# Create placeholder files that will be filled in later
touch "$research_file" 2>/dev/null || true
touch "$data_model_file" 2>/dev/null || true
touch "$quickstart_file" 2>/dev/null || true

# Output the result
if [[ "$json_output" == true ]]; then
    echo "{ 
        \"FEATURE_SPEC\": \"$spec_file\",
        \"IMPL_PLAN\": \"$impl_plan_file\",
        \"SPECS_DIR\": \"$feature_dir\",
        \"BRANCH\": \"$branch_name\",
        \"RESEARCH_FILE\": \"$research_file\",
        \"DATA_MODEL_FILE\": \"$data_model_file\",
        \"QUICKSTART_FILE\": \"$quickstart_file\"
    }" | jq .
else
    echo "Created implementation plan: $impl_plan_file"
    echo "Feature spec: $spec_file"
    echo "Branch: $branch_name"
    echo "Research file: $research_file"
    echo "Data model: $data_model_file"
    echo "Quickstart guide: $quickstart_file"
fi