---
description: Execute adaptive implementation planning with clear phases, evolution strategies, and context-aware deliverables.
handoffs:
  - label: Generate Adaptive Tasks
    agent: arckit.tasks
    prompt: Generate adaptive implementation tasks that consider evolution scenarios and context dependencies...
  - label: Create Quality Checklist
    agent: arckit.checklist
    prompt: Create a quality checklist for the adaptive implementation plan
    send: true
scripts:
  sh: scripts/bash/setup-plan.sh --json
  ps: scripts/powershell/setup-plan.ps1 -Json
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

1. **Setup**: Run `{SCRIPT}` from repo root and parse JSON for DESIGN_FILE, PLAN_FILE, SPECS_DIR, BRANCH. For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot' (or double-quote if possible: "I'm Groot").

2. **Load adaptive context**: Read DESIGN_FILE, SPEC_FILE, and `.arc/memory/constitution.md`. Load PLAN_FILE template (already copied). Consider:
   - Current implementation requirements from the specification
   - Evolution scenarios and potential requirement changes
   - Context dependencies and system constraints
   - Adaptive quality standards from the constitution

3. **Execute adaptive planning workflow**: Follow the structure in PLAN_FILE template to:
   - Define Adaptive Implementation Strategy (practical approach that supports evolution)
   - Create Task Breakdown with evolution considerations (specific, actionable tasks that account for future changes)
   - Design Execution Approach with context awareness (how to execute the plan considering different environments)
   - Plan Adaptive Risk Mitigation (how to handle potential problems including evolution-related risks)
   - **CRITICAL**: Establish comprehensive testing strategy (unit, integration, system tests) including:
     - Tests for current functionality
     - Tests for evolution scenarios (how features behave when requirements change)
     - Context-aware testing (validation across different deployment environments)
   - **CRITICAL**: Plan functionality verification procedures that consider adaptability
   - **CRITICAL**: Design dependency validation and integration testing with evolution in mind
   - **CRITICAL**: Plan error handling and edge case verification with adaptation strategies
   - Establish Adaptive Quality Assurance procedures (validation during implementation that considers evolution)
   - Design Context Feedback mechanisms (how to gather feedback in different deployment scenarios)

4. **Adaptive Planning Validation**: Validate plan against:
   - Implementation requirements from spec and design
   - Feasibility assessment including adaptation feasibility
   - Quality standards and evolution strategies
   - Context dependencies and cross-environment considerations

5. **Generate Adaptive Planning Artifacts**: Create planning documents that incorporate:
   - Clear milestones
   - Defined deliverables
   - Progress tracking mechanisms

## Implementation Strategy

### Practical Implementation Approach

1. **Development Approach**:
   - How implementation will be approached step by step
   - Phases designed for iterative progress
   - Integration points with existing system

2. **Resource Allocation**:
   - How to allocate time and effort efficiently
   - Conditional strategies for different scenarios
   - Resource planning for different complexity levels

3. **Implementation Pathways**:
   - Multiple implementation paths for different contexts
   - Alternative approaches if primary path fails
   - Contingency plans for technical challenges

## Task Breakdown

### Task Management

1. **Structured Tasks**:
   - Tasks with clear priority and dependencies
   - Dependencies that are well-defined and manageable
   - Milestones that track progress against requirements

2. **Well-Defined Dependencies**:
   - Dependencies with clear requirements
   - Alternative paths when dependencies are delayed
   - Dependency tracking and management

3. **Progress-Driven Tasks**:
   - How tasks progress based on intermediate results
   - Task completion criteria
   - Task assignment and tracking procedures

## Risk Mitigation

### Risk Management

1. **Technical Risks**:
   - Risks related to implementation complexity
   - Mitigation strategies with clear actions
   - Contingency plans for technical failures

2. **Timeline Risks**:
   - Risks related to schedule delays
   - Mitigation for unexpected complexity
   - Fallback strategies for timeline pressure

3. **Quality Risks**:
   - Risks to code quality and functionality
   - Validation mechanisms for deliverables
   - Quality control checkpoints

## Quality Assurance

### Validation Strategies

1. **Testing Approach**:
   - Testing strategies that account for requirements
   - Validation methods for different components
   - Quality gates that ensure standards

2. **Verification Process**:
   - Clear verification criteria for different features
   - Validation during development phases
   - Consistency checks against requirements

3. **Quality Monitoring**:
   - Tracking implementation effectiveness
   - Quality metrics that measure standards
   - Alerting for quality issues

## Feedback Mechanisms

### Continuous Improvement

1. **Implementation Feedback**:
   - How implementation process incorporates feedback
   - Feedback loops between implementation and design
   - Improvement mechanisms based on progress

2. **Progress Tracking**:
   - How progress is measured and reported
   - Milestone tracking and reporting
   - Progress reporting schedules

3. **Plan Adjustment**:
   - How the planning process adapts to new information
   - Adjustment procedures for changing requirements
   - Learning from plan execution outcomes

## Key rules

- Plan for practical implementation throughout the project
- Include clear quality and testing requirements
- Build in progress tracking and feedback mechanisms
- ERROR on plans that don't accommodate practical development

## Next Step Recommendation

Now that your plan is complete, the most logical next step is:

- **Primary**: Run `/arckit.chain` to generate task chains based on your implementation plan
- **Alternative**: Run `/arckit.checklist` to create a quality checklist for your plan

The `/arckit.chain` command will break down your plan into actionable task chains that can be executed with clear progress tracking.

**Pro tip**: Use the implementation strategy and feedback mechanisms you defined in your plan as guidance during task chain execution.
