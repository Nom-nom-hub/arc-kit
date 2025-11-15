#!/usr/bin/env bash
# /// script
# depends = ["jq"]
# ///

# Create a new feature branch and specification file with adaptive reasoning chains
# Usage: ./create-new-feature.sh --json [--number N] [--short-name name] "feature description"
# Or: ./create-new-feature.sh --json "feature description" (auto-numbering)

set -euo pipefail

# Source common functions
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Default values
number=""
short_name=""
description=""
json_output=false

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --json)
            json_output=true
            shift
            ;;
        --number)
            number="$2"
            shift 2
            ;;
        --short-name)
            short_name="$2"
            shift 2
            ;;
        -*)
            echo "Unknown option: $1" >&2
            exit 1
            ;;
        *)
            if [[ -z "$description" ]]; then
                description="$1"
            else
                description="$description $1"
            fi
            shift
            ;;
    esac
done

# Validate inputs
if [[ -z "$description" ]]; then
    if [[ "$json_output" == true ]]; then
        echo "{}"
    else
        echo "Error: Feature description is required" >&2
    fi
    exit 1
fi

# If number or short_name are not provided, calculate them
if [[ -z "$number" ]] || [[ -z "$short_name" ]]; then
    if [[ -z "$short_name" ]]; then
        short_name=$(create_branch_name "$description")
    fi
    
    if [[ -z "$number" ]]; then
        number=$(get_next_feature_number "$short_name")
    fi
fi

# Ensure we're in a git repository
validate_git_repo

# Initialize the spec directory
result_json=$(initialize_spec_directory "$number" "$short_name" "$description")

# Extract values from JSON result
branch_name=$(echo "$result_json" | jq -r '.BRANCH_NAME')
spec_file=$(echo "$result_json" | jq -r '.SPEC_FILE')

# Create the branch
checkout_branch "$branch_name"

# Create the initial spec file with adaptive template
cat > "$spec_file" << 'EOF'
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

EOF

# Ensure the constitution exists
ensure_constitution_exists

# Ensure the arckit structure exists
ensure_arckit_structure

# Output the result
if [[ "$json_output" == true ]]; then
    # Add additional paths to the JSON result
    echo "$result_json" | jq --arg SPEC_FILE "$spec_file" --arg BRANCH_NAME "$branch_name" --arg FEATURE_DIR "$(dirname "$spec_file")" --arg CHECKLIST_FILE "$(dirname "$spec_file")/checklists/adaptive-requirements.md" '
        . + {SPEC_FILE: $SPEC_FILE, BRANCH_NAME: $BRANCH_NAME, FEATURE_DIR: $FEATURE_DIR, CHECKLIST_FILE: $CHECKLIST_FILE}
    '
else
    echo "Created feature branch: $branch_name"
    echo "Specification file: $spec_file"
    echo "Feature directory: $(dirname "$spec_file")"
fi