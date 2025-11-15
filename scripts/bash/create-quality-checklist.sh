#!/usr/bin/env bash
# /// script
# requires-python = false
# depends = ["jq"]
# ///

# Create quality checklist with adaptive reasoning chains
# Usage: ./create-quality-checklist.sh --json

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

# Define the checklist file path
checklist_dir="${feature_dir}/checklists"
checklist_file="${checklist_dir}/adaptive-requirements.md"

# Create checklist directory
mkdir -p "$checklist_dir"

# Create the quality checklist file
cat > "$checklist_file" << 'EOF'
# Adaptive Requirements Quality Checklist: [FEATURE NAME]

**Feature**: [Feature name from spec]
**Branch**: [Branch name]
**Created**: [Date]
**Last Updated**: [Date]
**Evolution Plan**: [Reference to evolution scenarios and adaptation strategies]
**Context Dependencies**: [List of environments and contexts this feature must support]

## Purpose

This checklist validates that adaptive feature requirements are complete, testable, and ready for implementation. It ensures all requirements support adaptive design patterns, evolution readiness, and context awareness with sophisticated reasoning chains and learning mechanisms integrated throughout.

## Specification Completeness Checklist with Adaptive Considerations

### User Stories & Adaptive Scenarios
- [ ] All user stories have clear, distinct purposes with assigned priorities (P1, P2, P3)
- [ ] Each story includes acceptance scenarios (Given/When/Then) with context variations
- [ ] Each story includes evolution scenarios for requirement changes
- [ ] P1 stories are independently implementable and testable across contexts
- [ ] P2 stories are independently implementable and testable across contexts
- [ ] P3 stories are independently implementable and testable across contexts
- [ ] Edge cases include context switching scenarios and evolution edge cases
- [ ] Story priorities are clearly justified with business value and complexity assessment
- [ ] User stories include independent test strategies across different evolution paths
- [ ] Adaptive considerations are documented for each user story's evolution over time

### Multi-Context Adaptive Requirements Definition
- [ ] All functional requirements are specified with context adaptation mechanisms
- [ ] Each requirement includes adaptability considerations and context switching logic
- [ ] Requirements support future evolution with migration strategies
- [ ] Non-functional requirements (performance, security) account for context changes
- [ ] Requirements explicitly define how they adapt to different environments
- [ ] Requirements include backward compatibility and schema evolution considerations
- [ ] Context switching requirements specify how the system adapts between environments
- [ ] Adaptive quality gates are defined for each requirement across contexts

### Adaptive Key Entities & Schema Evolution Models
- [ ] All entities are identified with context-specific variations documented
- [ ] Entity attributes include context adaptation fields and evolution flags
- [ ] Relationships between entities support cross-context linking
- [ ] Schema evolution paths are explicitly planned with migration scripts
- [ ] Migration strategies include backward compatibility layers
- [ ] Entity evolution includes data transformation and validation mechanisms
- [ ] Context-specific entity rules are documented with adaptation logic

### Adaptive Success Criteria & Evolution Metrics
- [ ] Current measurable outcomes are defined with context-specific variations
- [ ] Outcomes are technology-agnostic across different implementation approaches
- [ ] Outcomes include adaptation effectiveness measurements
- [ ] Evolution success criteria are defined with measurable adaptation metrics
- [ ] Metrics for cross-context performance and adaptation effectiveness are included
- [ ] Scalability metrics account for evolution overhead and context switching costs
- [ ] Success criteria include evolution readiness and adaptation speed measurements

## Adaptive Design Validation with Context Awareness

### Advanced Adaptive Architecture Support
- [ ] Design supports independent evolution of components across contexts
- [ ] Components can be updated independently without breaking other contexts
- [ ] Interfaces are designed for versioning and context-specific implementations
- [ ] External dependencies are abstracted with context-specific adapters
- [ ] Configuration can be changed per context without code changes
- [ ] Context switching mechanisms don't require architectural changes
- [ ] Evolution pathways allow safe rollback to previous contexts and versions

### Context Intelligence & Adaptation Validation
- [ ] System requirements identify all target contexts and their variations
- [ ] Adaptation logic is planned for seamless context switching
- [ ] Context-specific configurations are validated against each target environment
- [ ] Context isolation prevents cross-contamination and maintains independence
- [ ] Context detection and switching mechanisms are tested and validated
- [ ] Context-specific performance requirements are defined and measured
- [ ] Adaptive context switching includes fallback mechanisms to safe states

### Adaptive Evolution & Schema Migration Validation
- [ ] Clear paths for requirement changes include context-specific evolution
- [ ] Breaking changes are identified with context-specific migration plans
- [ ] Non-breaking enhancements support parallel context operation
- [ ] Rollback strategies work independently for each context
- [ ] Evolution scenarios include cross-context impact analysis
- [ ] Schema evolution considers context-specific data transformation needs

## Adaptive Test-First Readiness with Evolution Scenarios

### Adaptive Testability Requirements
- [ ] Each user story can be tested independently in each target context
- [ ] Acceptance scenarios include context variations and adaptation verification
- [ ] Edge cases have test coverage across all relevant contexts and evolution paths
- [ ] Evolution scenarios are testable with adaptation effectiveness measurements
- [ ] Tests can run in isolation per context with context-specific fixtures
- [ ] Context switching itself has dedicated test coverage and verification
- [ ] Adaptive behavior is verified through automated test scenarios

### Adaptive Test Strategy with Context & Evolution Coverage
- [ ] Contract tests are planned per context with adaptation validation
- [ ] Integration tests cover cross-context interactions and evolution scenarios
- [ ] Unit tests validate adaptation logic and context switching mechanisms
- [ ] Acceptance tests verify user story completion across target contexts
- [ ] Context-switching tests validate seamless transitions and data consistency
- [ ] Evolution scenario tests verify behavior during requirement changes
- [ ] Adaptation effectiveness tests measure system's response to change

### Adaptive Test Organization for Context & Evolution
- [ ] Test structure aligns with user stories and supports context variations
- [ ] Test files map to both source structure and evolution pathways
- [ ] Context-specific test utilities and helpers are provided
- [ ] Mock/stub strategy accounts for context switching and adaptation
- [ ] Adaptive test infrastructure is planned with context and evolution support
- [ ] Test data management supports evolution scenarios and context variations

## Constitutional Alignment with Adaptive Evolution Principles

### Adaptive Architecture Principle Validation
- [ ] Design supports gradual evolution across contexts without major refactoring
- [ ] Changes are planned to be safe and reversible per context
- [ ] Interfaces are designed for versioning and context-specific extensions
- [ ] Architecture accommodates changing requirements in each context independently
- [ ] Dependencies are managed for evolution with context-specific abstraction
- [ ] Adaptive architectural patterns support context switching and evolution
- [ ] System evolution maintains consistency across different contexts

### Adaptive Test-First Development Validation
- [ ] Requirements are written in testable, context-aware format
- [ ] Acceptance scenarios support context-specific test-first approach
- [ ] Edge cases include context switching and adaptation scenarios
- [ ] Evolution scenarios include test-first validation of changes
- [ ] Adaptive tests are written before implementation of adaptation logic
- [ ] Context switching behavior is testable from the start

### Adaptive Library-First Development Validation
- [ ] Feature can be built as context-aware, adaptable library initially
- [ ] Clear library boundaries support context switching and evolution
- [ ] Dependencies are minimal, documented, and context-abstracted
- [ ] Public interfaces are well-defined for different contexts and evolution
- [ ] Library evolution maintains backward compatibility across contexts
- [ ] Context-specific adapters can be built on the core library

## Adaptive Assumptions & Context-Dependent Dependencies

### Adaptive Assumptions Documentation
- [ ] Business assumptions include context-specific variations and evolution impacts
- [ ] Technical assumptions account for different contexts and evolution paths
- [ ] External condition assumptions specify context and evolution dependencies
- [ ] Assumption validation strategies include context and evolution testing
- [ ] Contingency plans consider context switching and evolution fallbacks
- [ ] Assumptions are regularly validated across all target contexts

### Adaptive Dependencies Management
- [ ] All external dependencies are identified with context-specific variations
- [ ] Dependency versions include context-specific compatibility matrices
- [ ] Vendor lock-in risks account for context and evolution requirements
- [ ] Alternative solutions are documented per context and evolution path
- [ ] Migration paths for dependency changes work across all contexts
- [ ] Context-specific dependency configurations are validated and tested

## Adaptive Quality Standards & Context Validation

### Adaptive Documentation Quality
- [ ] Specification language is clear across different contexts and evolution paths
- [ ] Context-specific technical terms are defined and explained
- [ ] Context-aware examples are provided for complex concepts
- [ ] Context-aware diagrams/visuals clarify complex adaptation concepts
- [ ] References to external standards include context-specific interpretations
- [ ] Evolution documentation explains how concepts change over time

### Adaptive Requirements Quality
- [ ] Requirements are specific and measurable across all contexts
- [ ] Requirements are independent per context while supporting evolution
- [ ] Requirements avoid unnecessary context-specific implementation detail
- [ ] Requirements don't contradict each other across contexts or evolution paths
- [ ] Requirements are traceable throughout design and evolution scenarios
- [ ] Adaptive requirements include feedback and learning mechanisms

### Adaptive Consistency & Coherence Validation
- [ ] No contradictions between context-specific requirements
- [ ] Context-aware terminology is consistent throughout
- [ ] Related requirements are properly linked across contexts
- [ ] Data flow is clearly defined across different contexts and evolution states
- [ ] Context-specific state transitions are well-documented and validated
- [ ] Evolution scenarios maintain consistency across contexts

## Adaptive Implementation Readiness with Evolution Planning

### Adaptive Architecture Decisions
- [ ] Technical approach is justified across all target contexts
- [ ] Alternative adaptive approaches were considered for each context
- [ ] Technology choices support context switching and evolution
- [ ] Architecture diagrams include context switching and evolution pathways
- [ ] Scaling considerations account for context switching overhead
- [ ] Evolution planning is integrated into architecture decisions

### Adaptive Implementation Order & Context Dependencies
- [ ] Phase sequencing accounts for context dependencies and evolution
- [ ] Context-specific dependencies between phases are clearly identified
- [ ] Blocking prerequisites include context and evolution requirements
- [ ] Parallel work opportunities consider context and evolution constraints
- [ ] Context-specific checkpoint validations are defined
- [ ] Evolution path dependencies are planned and validated

### Adaptive Success Validation & Context Verification
- [ ] Acceptance criteria map to context-specific requirements
- [ ] Context-specific validation approach is defined and tested
- [ ] Test scenarios cover all contexts and evolution pathways
- [ ] Context-specific performance validation is planned and measurable
- [ ] User acceptance testing covers all target contexts
- [ ] Evolution scenarios have dedicated validation criteria

## Advanced Evolution & Context-Adaptive Planning

### Short-term Context Evolution (0-6 months)
- [ ] Context-specific enhancements are identified and prioritized
- [ ] Context migration paths are planned with evolution strategies
- [ ] Cross-context backward compatibility approach is clear
- [ ] Context-specific performance adaptations are planned and measured
- [ ] New context requirements are anticipated and prepared
- [ ] Short-term evolution includes adaptation effectiveness metrics

### Medium-term Context Evolution (6-18 months)
- [ ] Major feature additions consider cross-context integration
- [ ] Context-specific schema evolution paths are defined with data migration
- [ ] Technology updates support multiple contexts and evolution
- [ ] Cross-context scaling requirements are anticipated and planned
- [ ] Integration points for new contexts are designed with evolution in mind
- [ ] Adaptive architecture evolution supports new context requirements

### Long-term Context Evolution (18+ months)
- [ ] Cross-context architectural changes are anticipated and planned
- [ ] Technology refresh cycles consider context evolution needs
- [ ] Context-specific business model evolution is considered
- [ ] Market changes requiring new contexts are anticipated
- [ ] Sustainability requirements across contexts and evolution are addressed
- [ ] Long-term adaptation strategies are defined and validated

## Adaptive Monitoring & Feedback Systems

### Adaptation Effectiveness Metrics
- [ ] System measures how well adaptations succeed in different contexts
- [ ] Feedback loops inform adaptation strategy improvements
- [ ] Context switching effectiveness is continuously measured
- [ ] Learning from adaptation failures is integrated into system evolution
- [ ] Cross-context adaptation consistency is monitored and validated

### Evolution Tracking & Context Validation
- [ ] Evolution scenarios are tracked across different contexts
- [ ] Context-specific evolution impact is measured and validated
- [ ] Cross-context evolution dependencies are monitored
- [ ] Evolution readiness metrics are calculated per context
- [ ] Adaptation success rates are tracked by context and evolution path

## Adaptive Risk Management & Safety Measures

### Context-Specific Risk Assessment
- [ ] Context switching risks are identified and mitigated
- [ ] Cross-context contamination risks are prevented
- [ ] Context-specific performance degradation risks are addressed
- [ ] Evolution risks include context migration failure scenarios
- [ ] Context-specific security risks are identified and mitigated

### Evolution Safety Measures
- [ ] Evolution scenarios include safety checks and validations
- [ ] Rollback mechanisms work independently for contexts and evolution
- [ ] Context switching includes safety validations and checks
- [ ] Evolution impact assessment includes cross-context analysis
- [ ] Fallback mechanisms are validated for each context and evolution path

## Sign-Off & Adaptive Approval Process

### Adaptive Requirements Owner Sign-Off
- [ ] Product owner/stakeholder reviewed context-specific requirements
- [ ] Approval date: _______________
- [ ] Approved by: _______________
- [ ] Contact: _______________
- [ ] Context and evolution requirements validated by: _______________

### Adaptive Technical Lead Sign-Off
- [ ] Technical lead reviewed adaptive architecture and context design
- [ ] Approval date: _______________
- [ ] Approved by: _______________
- [ ] Contact: _______________
- [ ] Context switching and evolution readiness validated by: _______________

### Adaptive Quality Assurance Sign-Off
- [ ] QA lead reviewed context-aware testability and evolution coverage
- [ ] Approval date: _______________
- [ ] Approved by: _______________
- [ ] Contact: _______________
- [ ] Adaptation effectiveness and context validation approved by: _______________

## Context & Evolution Issues & Actions

### Identified Context & Evolution Issues
| Issue | Priority | Owner | Target Resolution | Context Impact | Evolution Impact |
|-------|----------|-------|-------------------|----------------|------------------|
| [Issue 1] | [High/Medium/Low] | [Name] | [Date] | [High/Medium/Low] | [High/Medium/Low] |
| [Issue 2] | [High/Medium/Low] | [Name] | [Date] | [High/Medium/Low] | [High/Medium/Low] |

### Context & Evolution Clarification Needed
- [ ] [Context area needing clarification]
- [ ] [Evolution path needing clarification]
- [ ] [Cross-context interaction needing clarification]
- [ ] [Evolution dependency needing clarification]

## Adaptive Checklist Summary & Evolution Readiness

### Overall Assessment by Context
- **Specification Completeness (Context A)**: [Complete/Mostly Complete/Needs Work]
- **Specification Completeness (Context B)**: [Complete/Mostly Complete/Needs Work]
- **Adaptive Readiness**: [Ready/Mostly Ready/Needs Work]
- **Cross-Context Testability**: [High/Medium/Low]
- **Implementation Readiness by Context**: [Ready/Mostly Ready/Needs Work]

### Adaptive Evolution Assessment
- **Short-term Evolution Readiness**: [Ready/Mostly Ready/Needs Work]
- **Medium-term Evolution Readiness**: [Ready/Mostly Ready/Needs Work]
- **Long-term Evolution Readiness**: [Ready/Mostly Ready/Needs Work]
- **Adaptation Effectiveness**: [High/Medium/Low]
- **Context Switching Maturity**: [High/Medium/Low]

### Next Adaptive Steps
1. [ ] [Context-specific action item]
2. [ ] [Evolution pathway action item]
3. [ ] [Adaptation mechanism action item]

### Adaptive Notes

[Additional observations and recommendations with context and evolution considerations]

EOF

# Output the result
if [[ "$json_output" == true ]]; then
    echo "{
        \"FEATURE_SPEC\": \"$spec_file\",
        \"CHECKLIST_FILE\": \"$checklist_file\",
        \"CHECKLIST_DIR\": \"$checklist_dir\",
        \"SPECS_DIR\": \"$feature_dir\",
        \"BRANCH\": \"$branch_name\"
    }" | jq .
else
    echo "Created quality checklist: $checklist_file"
    echo "Feature spec: $spec_file"
    echo "Branch: $branch_name"
fi
