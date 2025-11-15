#!/usr/bin/env bash
# /// script
# requires-python = false
# depends = ["jq"]
# ///

# Common functions and utilities for Arc Kit scripts
# This file is sourced by other scripts to provide shared functionality

set -euo pipefail

# Default values
DEFAULT_SPECS_DIR=".arc/specs"
DEFAULT_MEMORY_DIR=".arc/memory"
DEFAULT_SPECIFY_DIR=".arc"

# Common utility functions

# Function to get the next feature number based on existing branches and spec directories
get_next_feature_number() {
    local feature_name="$1"
    local sanitized_name
    sanitized_name=$(echo "$feature_name" | sed 's/[^a-zA-Z0-9-]/-/g' | sed 's/--*/-/g' | sed 's/^-\|-$//g' | tr '[:upper:]' '[:lower:]')

    # Find the highest number across remote branches, local branches, and spec directories
    local max_number=0
    local current_number

    # Check remote branches
    if command -v git >/dev/null 2>&1 && git rev-parse --git-dir >/dev/null 2>&1; then
        git fetch --all --prune 2>/dev/null || true
        local remote_numbers
        remote_numbers=$(git ls-remote --heads origin 2>/dev/null | grep -oE "[0-9]+-$sanitized_name$" | cut -d'-' -f1 || true)
        for num in $remote_numbers; do
            if [[ "$num" =~ ^[0-9]+$ ]] && [ "$num" -gt "$max_number" ]; then
                max_number=$num
            fi
        done
    fi

    # Check local branches
    if command -v git >/dev/null 2>&1 && git rev-parse --git-dir >/dev/null 2>&1; then
        local local_numbers
        local_numbers=$(git branch 2>/dev/null | grep -oE "^[* ]*[0-9]+-$sanitized_name$" | sed 's/^[* ]*//' | cut -d'-' -f1 || true)
        for num in $local_numbers; do
            if [[ "$num" =~ ^[0-9]+$ ]] && [ "$num" -gt "$max_number" ]; then
                max_number=$num
            fi
        done
    fi

    # Check spec directories
    if [[ -d "$DEFAULT_SPECS_DIR" ]]; then
        local spec_numbers
        spec_numbers=$(find "$DEFAULT_SPECS_DIR" -maxdepth 1 -name "[0-9]*-$sanitized_name" -type d 2>/dev/null | grep -oE "/[0-9]+-$sanitized_name$" | sed 's/\/\([0-9]\+\).*/\1/' || true)
        for num in $spec_numbers; do
            if [[ "$num" =~ ^[0-9]+$ ]] && [ "$num" -gt "$max_number" ]; then
                max_number=$num
            fi
        done
    fi

    # Return the next number
    echo $((max_number + 1))
}

# Function to create a branch name from a feature description
create_branch_name() {
    local description="$1"
    # Extract key terms, convert to lowercase, replace spaces with hyphens
    echo "$description" | sed 's/[^a-zA-Z0-9 ]/ /g' | tr '[:upper:]' '[:lower:]' | sed 's/  */ /g' | sed 's/^ *//;s/ *$//' | sed 's/ /-/g'
}

# Function to create the specs directory structure and initialize files
initialize_spec_directory() {
    local number="$1"
    local short_name="$2"
    local description="$3"
    
    local branch_name="${number}-${short_name}"
    local spec_dir="${DEFAULT_SPECS_DIR}/${branch_name}"
    
    # Create the spec directory
    mkdir -p "$spec_dir"
    
    # Create subdirectories
    mkdir -p "${spec_dir}/contracts"
    mkdir -p "${spec_dir}/implementation-details"
    mkdir -p "${spec_dir}/checklists"
    
    # Return JSON with branch name and spec file path
    echo "{ \"BRANCH_NAME\": \"$branch_name\", \"SPEC_FILE\": \"$spec_dir/spec.md\", \"FEATURE_DIR\": \"$spec_dir\", \"NUMBER\": \"$number\", \"SHORT_NAME\": \"$short_name\" }"
}

# Function to validate if we're in a git repository
validate_git_repo() {
    if ! command -v git >/dev/null 2>&1 || ! git rev-parse --git-dir >/dev/null 2>&1; then
        echo "Error: Not in a git repository" >&2
        exit 1
    fi
}

# Function to checkout or create a git branch
checkout_branch() {
    local branch_name="$1"
    
    # Fetch latest remote branches
    git fetch --all --prune 2>/dev/null || true
    
    # Check if branch exists locally or remotely
    if git show-ref --verify --quiet "refs/heads/$branch_name" || git ls-remote --exit-code origin "$branch_name" >/dev/null 2>&1; then
        # Branch exists, try to checkout
        if ! git checkout "$branch_name" 2>/dev/null; then
            # If local checkout fails, try pulling from remote
            if git ls-remote --exit-code origin "$branch_name" >/dev/null 2>&1; then
                git checkout -b "$branch_name" "origin/$branch_name" 2>/dev/null || git checkout "$branch_name"
            fi
        fi
    else
        # Branch doesn't exist, create new one
        local main_branch
        main_branch=$(git remote show origin | grep 'HEAD branch' | cut -d':' -f2 | xargs || echo "main")
        git checkout -b "$branch_name" "origin/$main_branch" 2>/dev/null || git checkout -b "$branch_name" || git checkout -b "$branch_name" main 2>/dev/null || git checkout -b "$branch_name" master 2>/dev/null || true
    fi
}

# Function to create or update the constitution file
ensure_constitution_exists() {
    # Ensure the arc structure exists first
    ensure_arc_structure

    local constitution_path="${DEFAULT_MEMORY_DIR}/constitution.md"

    if [[ ! -f "$constitution_path" ]]; then
        mkdir -p "$(dirname "$constitution_path")"
        cat > "$constitution_path" << 'EOF'
# Adaptive Project Constitution

**Version**: 2.0
**Created**: [DATE]
**Last Updated**: [DATE]
**Evolution Plan**: [Path to evolution scenarios and adaptation strategies]
**Context Dependencies**: [Environments and contexts this constitution must support]

## Purpose

This constitution establishes the governance principles for the adaptive project development team. These principles guide decision-making and ensure consistency across all development activities with sophisticated adaptation mechanisms, evolution planning, and context awareness integrated throughout.

## Core Adaptive Principles

### Article I: Advanced Adaptive Architecture Principle
- All system components must be designed for independent evolution across multiple contexts
- Changes should be gradual, safe, and reversible with rollback mechanisms
- Interfaces should be versioned, backward-compatible, and context-aware with intelligent adaptation
- Architecture should accommodate changing requirements with learning mechanisms
- Components must support dynamic configuration and context switching
- Evolution pathways must be planned and validated before implementation

### Article II: Adaptive Test-First Development with Learning
- All implementation must follow strict Test-Driven Development with evolution scenarios
- Unit tests must be written before implementation code with context variations
- Tests must be validated and approved before implementation begins with adaptation verification
- All tests must initially fail (Red phase) before implementation across all contexts
- Tests must include evolution scenario validation and feedback mechanism verification
- Context-switching tests must validate seamless transitions

### Article III: Adaptive Library-First Development with Context Isolation
- Every feature must begin as a standalone, context-aware library
- No feature should be implemented directly in application code without first being abstracted
- Libraries should have clear boundaries, minimal dependencies, and cross-context compatibility
- All functionality should be accessible through well-defined, adaptive interfaces
- Libraries must support evolution with backward compatibility mechanisms
- Context adapters must be designed as separate components

### Article IV: Continuous Learning & Reasoning Chain Integration
- All decisions must be documented with reasoning chains linking to outcomes
- Learning mechanisms must be built into every component to improve adaptation
- Feedback loops must connect implementation effectiveness to design decisions
- Evolution impact must be traced from requirements to implementation
- Context-specific adaptation effectiveness must be continuously measured
- Knowledge gained must inform future architectural decisions

### Article V: Evolution-Ready Development
- All code must be designed with evolution pathways in mind
- Schema migration strategies must be planned before implementation
- Backward compatibility must be maintained during evolution
- Evolution scenarios must be tested before changes are implemented
- Rollback strategies must be designed before forward evolution
- Cross-component evolution dependencies must be managed systematically

## Advanced Development Guidelines

### Adaptive Implementation Requirements
- [ ] All code must have corresponding cross-context tests
- [ ] New features must be implemented as context-aware libraries first
- [ ] All external interfaces must be versioned and backward-compatible
- [ ] Error handling must be comprehensive and context-adaptive with intelligent fallbacks
- [ ] Context switching mechanisms must be seamless and state-preserving
- [ ] Adaptation effectiveness metrics must be implemented and monitored
- [ ] Reasoning chains must link all decisions to outcomes with evolution impact

### Adaptive Quality Standards
- [ ] Code must pass all existing tests across all contexts
- [ ] New tests must achieve 80%+ coverage including evolution scenarios
- [ ] Performance requirements must be met with context switching overhead accounted for
- [ ] Security standards must be maintained across all contexts
- [ ] Adaptation effectiveness must be measured and validated
- [ ] Evolution readiness must be verified for all components
- [ ] Context isolation must prevent cross-contamination

### Adaptive Evolution Requirements
- [ ] Schema evolution strategies must be defined for all data components
- [ ] Migration paths must be tested and validated before implementation
- [ ] Backward compatibility layers must be implemented where needed
- [ ] Evolution scenarios must be tested with real data and contexts
- [ ] Rollback mechanisms must be validated across all contexts
- [ ] Cross-component evolution dependencies must be managed

## Adaptive Architecture Standards

### Context Management
- [ ] Context detection mechanisms must be reliable and fast
- [ ] Context-specific configurations must be isolated and manageable
- [ ] Cross-context data consistency must be maintained
- [ ] Context switching must be transparent to end users
- [ ] Context-specific performance requirements must be met

### Adaptation Mechanisms
- [ ] Adaptation logic must be separate from core business logic
- [ ] Learning algorithms must improve adaptation over time
- [ ] Feedback integration must be real-time and reliable
- [ ] Adaptation effectiveness must be continuously measured
- [ ] Fallback mechanisms must be available for failed adaptations

### Evolution Management
- [ ] Evolution pathways must be planned before implementation
- [ ] Migration strategies must be tested with real data
- [ ] Backward compatibility must be verified for all changes
- [ ] Evolution impact analysis must be performed for all changes
- [ ] Rollback procedures must be documented and tested

## Change Process with Learning Integration

This constitution may be updated as the team learns and evolves. Changes should be made thoughtfully with team input, clear justification, and consideration for evolution pathways. All changes must follow the same adaptive principles and include:

- Reasoning chains connecting the change to business outcomes
- Evolution scenarios for how the change might need to adapt
- Context impact analysis across all target environments
- Backward compatibility strategies
- Testing requirements including evolution scenarios
- Rollback procedures for the constitutional change

Updates to this constitution must be validated across all contexts and evolution scenarios before implementation.

EOF
    fi
}

# Function to create or update the .arc directory structure
ensure_arc_structure() {
    mkdir -p "${DEFAULT_SPECIFY_DIR}/scripts"
    mkdir -p "${DEFAULT_SPECIFY_DIR}/templates"
    mkdir -p "${DEFAULT_SPECIFY_DIR}/memory"
}