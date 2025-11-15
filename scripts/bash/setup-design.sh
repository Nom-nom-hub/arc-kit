#!/usr/bin/env bash
# /// script
# depends = ["jq"]
# ///

# Setup adaptive architecture design
# Usage: ./setup-design.sh --json

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

# Define the architecture document file path
arch_doc_file="${feature_dir}/architecture.md"

# Create the architecture document file with adaptive template
cat > "$arch_doc_file" << 'EOF'
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

EOF

# Define paths for other artifacts that will be created
data_model_file="${feature_dir}/data-model.md"
contracts_dir="${feature_dir}/contracts"
quickstart_file="${feature_dir}/quickstart.md"

# Create placeholder files that will be filled in later
touch "$data_model_file" 2>/dev/null || true
mkdir -p "$contracts_dir" 2>/dev/null || true
touch "$quickstart_file" 2>/dev/null || true

# Output the result
if [[ "$json_output" == true ]]; then
    echo "{ 
        \"FEATURE_SPEC\": \"$spec_file\",
        \"ARCHITECTURE_DOC\": \"$arch_doc_file\",
        \"SPECS_DIR\": \"$feature_dir\",
        \"BRANCH\": \"$branch_name\",
        \"DATA_MODEL_FILE\": \"$data_model_file\",
        \"CONTRACTS_DIR\": \"$contracts_dir\",
        \"QUICKSTART_FILE\": \"$quickstart_file\"
    }" | jq .
else
    echo "Created architecture document: $arch_doc_file"
    echo "Feature spec: $spec_file"
    echo "Branch: $branch_name"
    echo "Data model: $data_model_file"
    echo "Contracts directory: $contracts_dir"
    echo "Quickstart guide: $quickstart_file"
fi