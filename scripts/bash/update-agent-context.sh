#!/usr/bin/env bash
# /// script
# depends = ["jq"]
# ///

# Update agent-specific context files with adaptive elements
# Usage: ./update-agent-context.sh AGENT_TYPE

set -euo pipefail

# Source common functions
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Default values
agent_type=""

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -*)
            echo "Unknown option: $1" >&2
            exit 1
            ;;
        *)
            if [[ -z "$agent_type" ]]; then
                agent_type="$1"
            fi
            shift
            ;;
    esac
done

if [[ -z "$agent_type" ]]; then
    echo "Error: Agent type is required" >&2
    exit 1
fi

# Define agent-specific file paths
case "$agent_type" in
    claude)
        agent_file=".claude/commands/arckit-rules.md"
        ;;
    gemini)
        agent_file=".gemini/commands/arckit-rules.md"
        ;;
    copilot)
        agent_file=".github/agents/arckit-agent.md"
        ;;
    cursor-agent)
        agent_file=".cursor/commands/arckit-rules.md"
        ;;
    qwen)
        agent_file=".qwen/commands/arckit-rules.md"
        ;;
    opencode)
        agent_file=".opencode/commands/arckit-rules.md"
        ;;
    codex)
        agent_file=".codex/commands/arckit-rules.md"
        ;;
    windsurf)
        agent_file=".windsurf/rules/arckit-rules.md"
        ;;
    kilocode)
        agent_file=".kilocode/rules/arckit-rules.md"
        ;;
    auggie)
        agent_file=".augment/rules/arckit-rules.md"
        ;;
    codebuddy)
        agent_file=".codebuddy/commands/arckit-rules.md"
        ;;
    roo)
        agent_file=".roo/rules/arckit-rules.md"
        ;;
    q)
        agent_file=".amazonq/prompts/arckit-prompts.md"
        ;;
    amp)
        agent_file=".agents/commands/arckit-rules.md"
        ;;
    shai)
        agent_file=".shai/commands/arckit-rules.md"
        ;;
    *)
        echo "Error: Unknown agent type: $agent_type" >&2
        exit 1
        ;;
esac

# Create the directory if it doesn't exist
mkdir -p "$(dirname "$agent_file")"

# Create or update the agent-specific file with adaptive reasoning elements
cat > "$agent_file" << 'EOF'
# Arc Kit Adaptive Reasoning Chains - Agent Rules

## Overview
This document contains the rules and guidelines for using Arc Kit with adaptive reasoning chains. Follow these guidelines to ensure consistent and effective use of the methodology.

## Core Principles

### Adaptive Reasoning Chains (ARC)
- Think in chains of reasoning that can adapt based on new information
- Consider how requirements might evolve and build in adaptability
- Use feedback loops to continuously improve the solution
- Maintain reasoning links between decisions and outcomes

### Adaptive Specification
- Focus on what users need and why (not how to implement)
- Identify which elements are core (stable) vs. flexible (evolvable)
- Build in feedback mechanisms to detect when adaptation is needed
- Document reasoning chains for all major decisions

### Adaptive Architecture
- Design systems that can evolve with changing requirements
- Create clear interfaces that isolate components from change
- Plan for gradual, safe evolution rather than major rewrites
- Include monitoring for when adaptations are needed

## Command Usage

### /arckit.define
- Create adaptive specifications that can evolve with changing requirements
- Identify core vs. flexible requirements
- Build in feedback loops for continuous improvement

### /arckit.analyze
- Analyze specifications for consistency and adaptation readiness
- Identify risks and improvement opportunities
- Evaluate adaptability of proposed solutions

### /arckit.design
- Design architectures that support requirement evolution
- Create flexible components with clear interfaces
- Plan for gradual, safe evolution

### /arckit.plan
- Create implementation plans with adaptation considerations
- Include strategies for how the plan might need to evolve
- Plan for feedback collection during implementation

### /arckit.chain
- Generate adaptive task chains with reasoning links
- Include checkpoints for plan adjustments
- Plan for parallel execution where possible

### /arckit.implement
- Implement with adaptation in mind
- Monitor for feedback that might require approach changes
- Document lessons learned for future adaptations

## Adaptive Reasoning Guidelines

### Context Awareness
- Consider the broader context when making decisions
- Identify how external factors might affect the solution
- Plan for context changes over time

### Feedback Integration
- Build in mechanisms to collect feedback about effectiveness
- Design systems to monitor their own performance
- Plan for how feedback will be used to improve the solution

### Evolution Planning
- Plan for how components might need to evolve
- Design migration paths for changing requirements
- Consider backward compatibility when planning changes

### Risk Assessment
- Identify risks related to adaptability
- Plan mitigation strategies for adaptation challenges
- Consider failure modes of adaptive elements

## Quality Standards

### Adaptive Design Quality
- [ ] Architecture supports requirement evolution
- [ ] Components have clear interfaces that allow adjustment
- [ ] Feedback mechanisms are built into the design
- [ ] Adaptation paths are clearly defined

### Implementation Quality
- [ ] Implementation follows adaptive design principles
- [ ] Code is maintainable and well-documented
- [ ] Tests cover current functionality and potential evolutions
- [ ] Error handling is comprehensive

### Adaptation Readiness
- [ ] Implementation includes monitoring for adaptation triggers
- [ ] Metrics are defined for measuring adaptation effectiveness
- [ ] Checkpoints exist for evaluating when changes are needed

## Best Practices

### Decision Documentation
- Document the reasoning behind major decisions
- Include alternatives that were considered
- Note conditions that might cause decisions to change

### Progressive Enhancement
- Start with core functionality and add adaptability features
- Plan for gradual improvements based on feedback
- Implement feedback mechanisms early in the process

### Test-Driven Adaptation
- Create tests for adaptive elements
- Verify that feedback mechanisms work properly
- Test evolution paths before they're needed

## Common Pitfalls to Avoid

- Building systems that assume requirements will never change
- Creating rigid interfaces that prevent evolution
- Failing to include feedback mechanisms
- Not planning for how adaptation decisions will be made
- Over-engineering adaptation mechanisms

## Additional Resources

- Review the project constitution for architectural principles
- Check the specification for adaptation requirements
- Refer to implementation plans for evolution strategies

EOF

echo "Updated agent context file: $agent_file"