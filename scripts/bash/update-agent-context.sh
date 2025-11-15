#!/usr/bin/env bash
# /// script
# requires-python = false
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
# Arc Kit: Advanced Adaptive Reasoning Chains - Agent Configuration

## Overview
This document contains comprehensive guidelines for using Arc Kit with sophisticated adaptive reasoning chains, evolution planning, context awareness, and learning mechanisms. Follow these advanced guidelines to implement highly adaptive systems with comprehensive evolution pathways and multi-context support.

## Core Advanced Principles

### Adaptive Reasoning Chain Architecture (ARCA)
- Think in sophisticated reasoning chains that adapt based on multi-context information and evolution triggers
- Consider how requirements might evolve across different contexts and build in comprehensive adaptability mechanisms
- Use integrated feedback loops with learning algorithms to continuously improve adaptation strategies
- Maintain traceable reasoning links between decisions, contexts, and outcomes with evolution impact analysis
- Integrate decision trees that account for context switching and requirement changes

### Advanced Adaptive Specification
- Focus on what users need and why across different contexts (not how to implement)
- Identify which elements are core (stable) vs. flexible (evolvable) across different environments
- Build in multi-context feedback mechanisms to detect when adaptation is needed
- Document comprehensive reasoning chains linking decisions to context variations and evolution paths
- Create context-specific success criteria with cross-context adaptability metrics

### Advanced Adaptive Architecture
- Design systems that can evolve independently across different contexts with coordinated evolution
- Create adaptive interfaces that dynamically adjust to different contexts while maintaining compatibility
- Plan for gradual, safe evolution with context-specific migration paths and backward compatibility
- Include advanced monitoring for when adaptations are needed in different contexts
- Implement context-aware component isolation with intelligent change propagation

### Context Intelligence & Learning Systems
- Implement systems that learn from context switching patterns and optimize adaptation
- Build in intelligent context detection and prediction mechanisms
- Design learning algorithms that improve adaptation effectiveness over time
- Create feedback integration systems that adapt to changing context requirements
- Plan for multi-dimensional evolution across contexts, requirements, and technology

## Command Usage with Advanced Adaptation

### /arckit.constitution
- Establish comprehensive project governance principles for multi-context adaptive development
- Define core adaptive principles, reasoning chain protocols, and evolution governance
- Create institutional learning and improvement systems with context awareness
- Plan for constitutional evolution as requirements and contexts change
- **Next**: `/arckit.define` for your first feature specification with context considerations

### /arckit.define
- Create sophisticated adaptive specifications that evolve with changing requirements across contexts
- Identify core vs. flexible requirements for each target context
- Build in multi-context feedback loops for continuous improvement and learning
- Plan for context-specific evolution scenarios with coordinated adaptation
- Document reasoning chains with evolution impact across contexts
- **Next**: `/arckit.analyze` to evaluate specification readiness or `/arckit.plan` for direct planning

### /arckit.analyze
- Analyze specifications for consistency and multi-context adaptation readiness
- Identify context-specific risks and improvement opportunities
- Evaluate adaptability of proposed solutions across different environments
- Assess evolution readiness across contexts and cross-context dependencies
- Validate reasoning chain completeness and context switching preparation
- **Next**: `/arckit.plan` to create implementation plan with context considerations

### /arckit.plan
- Create comprehensive implementation plans with context-aware adaptation considerations
- Include strategies for how the plan might need to evolve in different contexts
- Plan for multi-context feedback collection during implementation
- Design context-specific evolution pathways with migration strategies
- Build in learning mechanisms that improve future planning based on context performance
- **Next**: `/arckit.tasks` to generate context-aware implementation tasks or `/arckit.implement` for direct execution

### /arckit.tasks
- Generate sophisticated implementation tasks from your plan with context and evolution awareness
- Break down work into executable steps for different contexts with cross-context dependencies
- Create task dependencies and execution order that accounts for context switching
- Include checkpoints for plan adjustments across contexts and evolution scenarios
- Plan for parallel execution where possible while maintaining context isolation
- Generate tasks for adaptation mechanisms, evolution planning, and learning systems
- **Next**: `/arckit.implement` for execution or `/arckit.checklist` for quality assurance

### /arckit.implement
- Implement with sophisticated multi-context adaptation in mind
- Monitor for feedback that might require approach changes across different contexts
- Document lessons learned for future adaptations and context optimizations
- Implement context switching mechanisms and adaptation algorithms
- Build in reasoning chain logging and evolution tracking
- **Next**: `/arckit.checklist` for quality verification or `/arckit.define` for next feature

### /arckit.checklist
- Create comprehensive adaptive quality checklists for multi-context development phases
- Verify implementation against adaptive requirements across all contexts
- Establish evolution-ready validation criteria with context-aware metrics
- Validate context switching effectiveness and adaptation mechanisms
- Check backward compatibility and migration readiness across contexts
- **Next**: Return to `/arckit.define` for next feature or use as reference for current implementation

### /arckit.clarify
- Resolve ambiguities in specifications with advanced adaptive considerations
- Ask targeted questions about context requirements and evolution scenarios
- Integrate answers directly into specifications with reasoning chain updates
- Clarify context switching requirements and adaptation mechanisms
- **Next**: `/arckit.plan` after clarifications or `/arckit.analyze` for re-analysis

## Advanced Adaptive Reasoning Guidelines

### Multi-Context Intelligence
- Consider all relevant contexts when making architectural decisions
- Identify how external context factors might affect the solution differently
- Plan for dynamic context changes over time with intelligent switching
- Build in context prediction and preparation mechanisms

### Learning-Integrated Feedback Systems
- Build in sophisticated mechanisms to collect feedback about effectiveness across contexts
- Design systems with intelligent self-monitoring and performance prediction
- Plan for how feedback will be used to improve adaptation using machine learning
- Create feedback loops that adapt to changing user behavior across contexts

### Multi-Dimensional Evolution Planning
- Plan for how components might need to evolve in different contexts independently
- Design sophisticated migration paths for changing requirements and context needs
- Consider multi-layer backward compatibility when planning changes across contexts
- Plan for coordinated evolution across dependent contexts

### Advanced Risk Management
- Identify sophisticated risks related to multi-context adaptability
- Plan comprehensive mitigation strategies for adaptation challenges across contexts
- Consider failure modes of adaptive elements in different contexts
- Design intelligent risk monitoring that adapts to changing conditions

## Advanced Quality Standards

### Adaptive Design Quality
- [ ] Architecture supports requirement evolution across all contexts
- [ ] Components have intelligent interfaces that adapt to different contexts
- [ ] Feedback mechanisms are built into the design with learning capabilities
- [ ] Adaptation paths are clearly defined for each context and cross-context scenarios
- [ ] Context switching is seamless with intelligent state management
- [ ] Learning algorithms improve adaptation effectiveness over time

### Advanced Implementation Quality
- [ ] Implementation follows sophisticated adaptive design principles across contexts
- [ ] Code is maintainable, well-documented, and context-abstracted
- [ ] Tests cover current functionality, context switching, and potential evolutions
- [ ] Error handling is comprehensive across contexts with intelligent fallbacks
- [ ] Performance is optimized for context switching with minimal overhead
- [ ] Security considerations are maintained across all contexts

### Evolution & Learning Readiness
- [ ] Implementation includes intelligent monitoring for adaptation triggers across contexts
- [ ] Sophisticated metrics are defined for measuring adaptation effectiveness by context
- [ ] Checkpoints exist for evaluating when changes are needed in real-time
- [ ] Learning mechanisms continuously improve adaptation strategies
- [ ] Evolution pathways are tested and validated across contexts

## Advanced Best Practices

### Comprehensive Decision Documentation
- Document the reasoning behind major decisions with context and evolution analysis
- Include alternatives considered for each context and their trade-offs
- Note conditions that might cause decisions to change across contexts
- Link decisions to reasoning chains with measurable outcomes

### Intelligent Progressive Enhancement
- Start with core cross-context functionality and add sophisticated adaptability features
- Plan for intelligent improvements based on multi-context feedback and learning
- Implement feedback mechanisms early with learning algorithm integration
- Build in context prediction and preparation systems

### Advanced Test-Driven Adaptation
- Create comprehensive tests for adaptive elements across all contexts
- Verify that feedback mechanisms work properly in each context
- Test evolution paths and migration scenarios before they're needed
- Validate context switching and cross-context integration
- Test learning algorithm effectiveness and improvement patterns

## Advanced Pitfalls to Avoid

- Building systems that assume contexts or requirements will never change
- Creating rigid interfaces that prevent evolution across contexts
- Failing to include comprehensive feedback and learning mechanisms
- Not planning for how sophisticated adaptation decisions will be made automatically
- Over-engineering adaptation mechanisms without considering context switching costs
- Ignoring cross-context dependencies and evolution coordination
- Creating context-specific implementations that can't evolve together
- Failing to build in learning and improvement mechanisms

## Advanced Implementation Strategies

### Context-Aware Architecture Patterns
- Implement context adapters that abstract environment-specific behaviors
- Use intelligent configuration management that adapts to context changes
- Apply circuit breaker patterns for context-specific failure isolation
- Build in context-specific caching and performance optimization

### Evolution-Ready Design
- Design for gradual migration with context-specific evolution paths
- Implement version tolerance and backward compatibility by context
- Plan for feature flagging and gradual rollout across contexts
- Create context-specific monitoring and observability

### Learning & Intelligence Integration
- Implement A/B testing frameworks for adaptation improvement
- Build in user behavior analysis for context optimization
- Create predictive models for context switching and requirement changes
- Design intelligent alerting and anomaly detection systems

## Advanced Resources & References

- Review the project constitution for architectural principles and evolution governance
- Check the specification for context-specific adaptation requirements
- Refer to implementation plans for evolution strategies and context coordination
- Consult reasoning chain documentation for decision traceability
- Access learning system logs for adaptation improvement insights

## Continuous Improvement & Evolution

### Learning System Integration
- Regularly update adaptation strategies based on performance data
- Continuously refine context detection and switching mechanisms
- Improve reasoning chain effectiveness through analysis
- Enhance evolution planning based on historical outcomes

### Multi-Context Optimization
- Optimize for context switching performance and efficiency
- Improve cross-context communication and data consistency
- Enhance learning algorithms based on context-specific patterns
- Refine evolution strategies based on multi-context outcomes

EOF

echo "Updated agent context file: $agent_file"