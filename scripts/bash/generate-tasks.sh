#!/usr/bin/env bash
# /// script
# depends = ["jq"]
# ///

# Generate adaptive task chains with reasoning links
# Usage: ./generate-tasks.sh --json

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

# Find the current feature branch and plan
current_branch=$(git branch --show-current 2>/dev/null || echo "")
plan_file=""
feature_dir=""
branch_name=""

if [[ -n "$current_branch" ]] && [[ "$current_branch" =~ ^[0-9]+- ]]; then
    branch_name="$current_branch"
    feature_dir="${DEFAULT_SPECS_DIR}/${current_branch}"
    plan_file="${feature_dir}/plan.md"
else
    # Try to find the most recent feature branch
    for dir in "${DEFAULT_SPECS_DIR}"/*; do
        if [[ -d "$dir" ]] && [[ "$(basename "$dir")" =~ ^[0-9]+- ]]; then
            branch_name=$(basename "$dir")
            feature_dir="$dir"
            plan_file="${dir}/plan.md"
            break
        fi
    done
fi

if [[ ! -f "$plan_file" ]]; then
    if [[ "$json_output" == true ]]; then
        echo "{}"
    else
        echo "Error: No implementation plan found in current branch or spec directories" >&2
    fi
    exit 1
fi

# Define the tasks file path
tasks_file="${feature_dir}/tasks.md"

# Create the tasks file with adaptive template
cat > "$tasks_file" << 'EOF'
# Adaptive Task Chain

## Feature
[Feature name from plan]

## Task Chain Overview
[Overview of the task chain and its adaptive elements]

## Adaptive Task Chain

### Phase 0: Research and Preparation [P]
[Parallelizable research and preparation tasks]

#### Task 1: Research Technology Stack
**Requirements Link**: [Link to relevant requirements in spec]
**Adaptation Reasoning**: [Why this research is needed and when approaches might need adjustment]
**Alternative Approaches**: [Different research approaches if primary doesn't work]
**Dependencies**: [None]
**Files to Create/Modify**: [research.md]
**Success Criteria**: [Research completed with actionable insights]
**Adaptation Triggers**: [If research reveals significant changes needed]
**Implementation Notes**: [How to conduct research with adaptability in mind]

**Prompt**: [Specific instructions for conducting technology research]

#### Task 2: Set up Development Environment
**Requirements Link**: [Link to relevant requirements in spec]
**Adaptation Reasoning**: [Why environment setup is needed and when it might need adjustment]
**Alternative Approaches**: [Different environment setup options]
**Dependencies**: [None]
**Files to Create/Modify**: [environment configuration files]
**Success Criteria**: [Development environment operational]
**Adaptation Triggers**: [If environment requirements change]
**Implementation Notes**: [How to set up environment to support future changes]

**Prompt**: [Specific instructions for environment setup]

[Add more Phase 0 tasks as needed]

### Phase 1: Data Model Implementation [P]
[Parallelizable data model implementation tasks]

#### Task 3: Define Core Data Entities
**Requirements Link**: [Link to relevant requirements in spec]
**Adaptation Reasoning**: [Why these entities are needed and how they might evolve]
**Alternative Approaches**: [Different modeling approaches if needed]
**Dependencies**: [Task 1: Research Technology Stack]
**Files to Create/Modify**: [data model files in data-model.md]
**Success Criteria**: [Core entities defined and documented]
**Adaptation Triggers**: [If requirements change significantly]
**Implementation Notes**: [How to design entities to support evolution]

**Prompt**: [Specific instructions for defining data entities]

#### Task 4: Implement Data Validation
**Requirements Link**: [Link to relevant requirements in spec]
**Adaptation Reasoning**: [Why validation is needed and how it might evolve]
**Alternative Approaches**: [Different validation approaches]
**Dependencies**: [Task 3: Define Core Data Entities]
**Files to Create/Modify**: [validation files]
**Success Criteria**: [Data validation implemented and tested]
**Adaptation Triggers**: [If validation requirements change]
**Implementation Notes**: [How to implement validation to support future changes]

**Prompt**: [Specific instructions for implementing data validation]

[Add more Phase 1 tasks as needed]

### Phase 2: Contract Definition [P]
[Parallelizable contract definition tasks]

#### Task 5: Define API Endpoints
**Requirements Link**: [Link to relevant requirements in spec]
**Adaptation Reasoning**: [Why these endpoints are needed and how they might evolve]
**Alternative Approaches**: [Different API patterns if needed]
**Dependencies**: [Task 3: Define Core Data Entities]
**Files to Create/Modify**: [contract files in contracts/]
**Success Criteria**: [API endpoints defined in contracts]
**Adaptation Triggers**: [If API requirements change]
**Implementation Notes**: [How to design APIs to support evolution]

**Prompt**: [Specific instructions for defining API endpoints]

#### Task 6: Define Data Interfaces
**Requirements Link**: [Link to relevant requirements in spec]
**Adaptation Reasoning**: [Why these interfaces are needed and how they might evolve]
**Alternative Approaches**: [Different interface patterns if needed]
**Dependencies**: [Task 3: Define Core Data Entities]
**Files to Create/Modify**: [interface files]
**Success Criteria**: [Data interfaces defined and documented]
**Adaptation Triggers**: [If interface requirements change]
**Implementation Notes**: [How to design interfaces to support evolution]

**Prompt**: [Specific instructions for defining data interfaces]

[Add more Phase 2 tasks as needed]

### Phase 3: Implementation [Sequential]
[Sequential implementation tasks that build on previous phases]

#### Task 7: Build Core Service Layer
**Requirements Link**: [Link to relevant requirements in spec]
**Adaptation Reasoning**: [Why service layer is needed and how it might evolve]
**Alternative Approaches**: [Different service architecture patterns]
**Dependencies**: [Task 4: Implement Data Validation, Task 5: Define API Endpoints]
**Files to Create/Modify**: [service layer files]
**Success Criteria**: [Core service layer implemented and tested]
**Adaptation Triggers**: [If service requirements change]
**Implementation Notes**: [How to implement service layer to support evolution]

**Prompt**: [Specific instructions for building service layer]

#### Task 8: Build API Controllers
**Requirements Link**: [Link to relevant requirements in spec]
**Adaptation Reasoning**: [Why controllers are needed and how they might evolve]
**Alternative Approaches**: [Different controller patterns if needed]
**Dependencies**: [Task 7: Build Core Service Layer]
**Files to Create/Modify**: [controller files]
**Success Criteria**: [API controllers implemented and connected to services]
**Adaptation Triggers**: [If API requirements change]
**Implementation Notes**: [How to implement controllers to support evolution]

**Prompt**: [Specific instructions for building API controllers]

[Add more Phase 3 tasks as needed]

### Phase 4: Integration and Testing
[Integration and testing tasks]

#### Task 9: Create Integration Tests
**Requirements Link**: [Link to relevant requirements in spec]
**Adaptation Reasoning**: [Why integration tests are needed and how they might evolve]
**Alternative Approaches**: [Different testing approaches if needed]
**Dependencies**: [Task 8: Build API Controllers]
**Files to Create/Modify**: [test files]
**Success Criteria**: [Integration tests passing, covering main scenarios]
**Adaptation Triggers**: [If integration requirements change]
**Implementation Notes**: [How to write tests to support future changes]

**Prompt**: [Specific instructions for creating integration tests]

#### Task 10: Validate Success Criteria
**Requirements Link**: [Link to relevant requirements in spec]
**Adaptation Reasoning**: [Why validation is needed and how it might evolve]
**Alternative Approaches**: [Different validation approaches if needed]
**Dependencies**: [Task 9: Create Integration Tests]
**Files to Create/Modify**: [validation files]
**Success Criteria**: [All success criteria from spec are met]
**Adaptation Triggers**: [If validation reveals needed changes]
**Implementation Notes**: [How to validate in a way that supports future evolution]

**Prompt**: [Specific instructions for validating success criteria]

[Add more Phase 4 tasks as needed]

### Phase 5: Adaptation and Monitoring
[Tasks for setting up adaptation mechanisms]

#### Task 11: Implement Feedback Collection
**Requirements Link**: [Link to relevant requirements in spec]
**Adaptation Reasoning**: [Why feedback collection is needed and how it might evolve]
**Alternative Approaches**: [Different feedback approaches if needed]
**Dependencies**: [Task 10: Validate Success Criteria]
**Files to Create/Modify**: [monitoring files]
**Success Criteria**: [Feedback collection mechanisms operational]
**Adaptation Triggers**: [If monitoring requirements change]
**Implementation Notes**: [How to implement feedback to support evolution]

**Prompt**: [Specific instructions for implementing feedback collection]

#### Task 12: Create Adaptation Documentation
**Requirements Link**: [Link to relevant requirements in spec]
**Adaptation Reasoning**: [Why adaptation docs are needed and how they might evolve]
**Alternative Approaches**: [Different documentation approaches if needed]
**Dependencies**: [Task 11: Implement Feedback Collection]
**Files to Create/Modify**: [documentation files]
**Success Criteria**: [Adaptation documentation complete and clear]
**Adaptation Triggers**: [If documentation requirements change]
**Implementation Notes**: [How to write docs to support future evolution]

**Prompt**: [Specific instructions for creating adaptation documentation]

[Add more Phase 5 tasks as needed]

## Adaptation Checkpoints

### Checkpoint 1: Research Review
- **When**: After Phase 0 completion
- **What**: Review research findings and adjust task chain if needed
- **Action**: [What to do if research reveals different approach is needed]

### Checkpoint 2: Design Validation
- **When**: After Phase 2 completion
- **What**: Validate design decisions and adapt if necessary
- **Action**: [What to do if design needs adjustment]

### Checkpoint 3: Implementation Review
- **When**: After Phase 3 completion
- **What**: Review implementation and plan any needed adaptations
- **Action**: [What to do if implementation reveals needed changes]

## Parallel Execution Guidelines

Tasks marked with [P] can be executed in parallel when their dependencies are met:
- Phase 0 tasks can be run in parallel
- Phase 1 tasks can be run in parallel after Phase 0
- Phase 2 tasks can be run in parallel after Phase 1 dependencies are met

## Success Validation

### Definition of Done
[Criteria that must be met for the task chain to be considered complete]

### Quality Gates
- [ ] All tests pass
- [ ] Success criteria from spec are met
- [ ] Adaptation mechanisms are operational
- [ ] Documentation is complete

## Notes

[Any additional notes about the task chain and implementation approach]

EOF

# Output the result
if [[ "$json_output" == true ]]; then
    echo "{
        \"PLAN_FILE\": \"$plan_file\",
        \"TASKS_FILE\": \"$tasks_file\",
        \"SPECS_DIR\": \"$feature_dir\",
        \"BRANCH\": \"$branch_name\"
    }" | jq .
else
    echo "Created task chain: $tasks_file"
    echo "Based on plan: $plan_file"
    echo "Branch: $branch_name"
fi