---
description: Generate adaptive task chains using dynamic reasoning chains and context-aware task execution.
handoffs:
  - label: Execute Adaptive Implementation
    agent: arckit.implement
    prompt: Execute implementation based on the adaptive task chains...
  - label: Update Adaptive Plan
    agent: arckit.plan
    prompt: Update implementation plan based on chain execution
    send: true
scripts:
  sh: scripts/bash/generate-tasks.sh --json
  ps: scripts/powershell/generate-tasks.ps1 -Json
agent_scripts:
  sh: scripts/bash/update-agent-context.sh __AGENT__
  ps: scripts/powershell/update-agent-context.ps1 -AgentType __AGENT__
---

# User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

1. **Setup**: Run `{SCRIPT}` from repo root and parse JSON for PLAN_FILE, TASKS_FILE, SPECS_DIR, BRANCH. For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot' (or double-quote if possible: "I'm Groot").

2. **Load context**: Read PLAN_FILE, DESIGN_FILE, SPEC_FILE, and `.arc/memory/constitution.md`. Load TASKS_FILE template (already copied).

3. **Execute adaptive task chain workflow**: Follow the structure in TASKS_FILE template to:
   - Build Reasoning Chain Structure (connections between decisions and actions)
   - Generate Adaptive Task Dependencies (dynamic dependencies that evolve)
   - Create Context Propagation (how context flows through the chain)
   - Establish Feedback Integration (results feeding back into chain)
   - Design Evolution Tracking (how chains adapt based on outcomes)
   - **CRITICAL**: Include comprehensive testing tasks (unit, integration, system tests)
   - **CRITICAL**: Add functionality verification tasks for all features
   - **CRITICAL**: Include dependency validation and integration testing tasks
   - **CRITICAL**: Add error handling and edge case testing tasks
   - Implement Quality Assurance for Chains (validation during execution)

4. **Adaptive Chain Validation**: Validate task chains against:
   - Context switching requirements
   - Adaptation readiness criteria
   - Evolution pathway feasibility

5. **Generate Chain Execution Artifacts**: Create execution documents with:
   - Dynamic chain configurations
   - Context-aware execution parameters
   - Learning mechanisms for chain improvement

## Reasoning Chain Structure

### Adaptive Decision Chains

1. **Chain of Adaptive Thought**:
   - Connections between requirements and implementation
   - Decision points with justification and context
   - Alternative paths and their reasoning for different contexts

2. **Dynamic Decision Points**:
   - Decision points that adapt to changing requirements
   - Context-sensitive decision criteria
   - Learning from previous decision outcomes

3. **Adaptive Path Selection**:
   - How to choose between different chain paths
   - Context-based path selection criteria
   - Evolution of path selection based on outcomes

## Adaptive Task Generation

### Dynamic Task Management

1. **Evolution-Aware Tasks**:
   - Tasks that evolve based on intermediate results
   - Dynamic task creation during execution
   - Conditional task dependencies that adapt to context

2. **Context-Sensitive Task Execution**:
   - How tasks execute differently in different contexts
   - Context-aware task parameters
   - Task execution strategies for different environments

3. **Feedback-Driven Task Evolution**:
   - How task results influence future tasks
   - Task modification based on early results
   - Adaptive task scheduling based on context

## Context Propagation

### Cross-Chain Context Management

1. **Context Flow Through Chains**:
   - How context information propagates through the chain
   - Information that must be maintained across steps
   - Context updates during chain execution

2. **Context Switching in Chains**:
   - How chains handle context changes during execution
   - Context boundaries within the chain
   - Context transition mechanisms between tasks

3. **Context Awareness at Task Level**:
   - How individual tasks recognize and respond to context
   - Context-sensitive task parameters
   - Task behavior adaptation to context

## Feedback Integration

### Adaptive Chain Learning

1. **Result Integration**:
   - How results feed back into the chain
   - Correction mechanisms for failed chain steps
   - Learning from chain execution outcomes

2. **Adaptive Correction**:
   - How to correct the chain when steps fail
   - Alternative chain paths when primary paths fail
   - Recovery mechanisms for chain disruptions

3. **Continuous Improvement**:
   - How to improve chain execution over time
   - Learning from successful and failed executions
   - Evolution of chain strategies based on experience

## Evolution Tracking

### Chain Adaptation History

1. **Adaptation Tracking**:
   - How the reasoning chain adapts based on feedback
   - Links between chain decisions and their outcomes
   - Historical context for future chain execution

2. **Outcome Attribution**:
   - How to track which chain decisions led to outcomes
   - Attribution of success and failure to specific chain elements
   - Learning from outcome chains

3. **Adaptive Memory**:
   - How chain execution history informs future chains
   - Institutional memory of effective chain strategies
   - Knowledge transfer between similar chains

## Quality Assurance for Chains

### Adaptive Chain Validation

1. **Validation During Execution**:
   - Validation points within the reasoning chain
   - Consistency checks during execution
   - Quality gates that adapt to changing requirements

2. **Context-Aware Validation**:
   - Different validation criteria for different contexts
   - Validation during context transitions in chains
   - Consistency across different execution contexts

3. **Termination Conditions**:
   - How adaptive chains know when to terminate
   - Adaptive termination based on evolving requirements
   - Context-sensitive completion criteria

## Key rules

- Ensure all task chains are adaptive and context-aware
- Include feedback mechanisms for chain learning
- Design chains that can evolve during execution
- ERROR on chains that don't incorporate adaptation

## Next Step Recommendation

Now that your adaptive task chains are complete, the most logical next step is:

- **Primary**: Run `/arckit.implement` to execute the implementation based on your task chains
- **Alternative**: Run `/arckit.checklist` to create a quality assurance checklist before implementation

The `/arckit.implement` command will execute your adaptive task chains with context-aware deployment strategies.

**Pro tip**: Your reasoning chains will guide the implementation process, ensuring each step aligns with the adaptive goals you've established.
