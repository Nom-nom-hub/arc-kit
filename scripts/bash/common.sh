#!/usr/bin/env bash
# /// script
# depends = ["jq"]
# ///

# Common functions and utilities for Arc Kit scripts
# This file is sourced by other scripts to provide shared functionality

set -euo pipefail

# Default values
DEFAULT_SPECS_DIR=".arckit/specs"
DEFAULT_MEMORY_DIR=".arckit/memory"
DEFAULT_SPECIFY_DIR=".arckit"

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
    # Ensure the arckit structure exists first
    ensure_arckit_structure

    local constitution_path="${DEFAULT_MEMORY_DIR}/constitution.md"

    if [[ ! -f "$constitution_path" ]]; then
        mkdir -p "$(dirname "$constitution_path")"
        cat > "$constitution_path" << 'EOF'
# Project Constitution

**Version**: 1.0
**Created**: [DATE]

## Purpose

This constitution establishes the governance principles for the project development team. These principles guide decision-making and ensure consistency across all development activities.

## Core Principles

### Article I: Adaptive Architecture Principle
- All system components must be designed for evolution
- Changes should be gradual and safe
- Interfaces should be versioned and backward-compatible
- Architecture should accommodate changing requirements

### Article II: Test-First Development
- All implementation must follow strict Test-Driven Development
- Unit tests must be written before implementation code
- Tests must be validated and approved before implementation begins
- All tests must initially fail (Red phase) before implementation

### Article III: Library-First Development
- Every feature must begin as a standalone library
- No feature should be implemented directly in application code without first being abstracted
- Libraries should have clear boundaries and minimal dependencies
- All functionality should be accessible through well-defined interfaces

## Development Guidelines

### Implementation Requirements
- [ ] All code must have corresponding tests
- [ ] New features must be implemented as libraries first
- [ ] All external interfaces must be well documented
- [ ] Error handling must be comprehensive and user-friendly

### Quality Standards
- [ ] Code must pass all existing tests
- [ ] New tests must achieve 80%+ coverage
- [ ] Performance requirements must be met
- [ ] Security standards must be maintained

## Change Process

This constitution may be updated as the team learns and evolves. Changes should be made thoughtfully with team input and clear justification.

EOF
    fi
}

# Function to create or update the .arckit directory structure
ensure_arckit_structure() {
    mkdir -p "${DEFAULT_SPECIFY_DIR}/scripts"
    mkdir -p "${DEFAULT_SPECIFY_DIR}/templates"
    mkdir -p "${DEFAULT_SPECIFY_DIR}/memory"
}