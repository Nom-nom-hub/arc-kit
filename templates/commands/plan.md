---
description: Execute adaptive implementation planning using dynamic reasoning chains and evolution-ready strategies.
handoffs:
  - label: Generate Adaptive Tasks
    agent: arckit.chain
    prompt: Generate adaptive task chains based on the plan...
  - label: Create Adaptive Checklist
    agent: arckit.checklist
    prompt: Create an adaptive checklist for the implementation plan
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

2. **Load context**: Read DESIGN_FILE, SPEC_FILE, and `/memory/constitution.md`. Load PLAN_FILE template (already copied).

3. **Execute adaptive planning workflow**: Follow the structure in PLAN_FILE template to:
   - Define Evolution Strategy (how implementation adapts to change)
   - Create Adaptive Task Breakdown (dynamic tasks that evolve)
   - Design Context-Sensitive Execution (behavior changes with environment)
   - Plan Risk Mitigation with Adaptation (evolving risk management)
   - Establish Quality Assurance for Adaptive Systems (validation during change)
   - Design Learning & Improvement mechanisms

4. **Adaptive Planning Validation**: Validate plan against:
   - Adaptation requirements from spec and design
   - Context switching readiness
   - Evolution pathway feasibility

5. **Generate Adaptive Planning Artifacts**: Create planning documents that incorporate:
   - Dynamic milestones
   - Context-aware deliverables
   - Learning mechanisms

## Evolution Strategy

### Dynamic Implementation Approach

1. **Adaptation Mechanisms**:
   - How implementation will adapt to changing requirements
   - Phases designed for iterative improvement
   - Feedback integration points

2. **Context Sensitivity**:
   - How implementation approach changes with environment
   - Conditional strategies for different scenarios
   - Resource allocation that adapts to needs

3. **Evolution Pathways**:
   - Multiple implementation paths for different contexts
   - Fork and merge strategies for divergent evolution
   - Rollback mechanisms for failed adaptations

## Adaptive Task Breakdown

### Dynamic Task Management

1. **Context-Adaptive Tasks**:
   - Tasks with dynamic priority based on context
   - Dependencies that may change during implementation
   - Milestones that adjust to evolving specifications

2. **Evolution-Ready Dependencies**:
   - Dependencies designed to accommodate change
   - Alternative dependency paths for different contexts
   - Dependency management during evolution

3. **Feedback-Driven Task Evolution**:
   - How tasks evolve based on intermediate results
   - Dynamic task creation during execution
   - Conditional task dependencies

## Risk Mitigation with Adaptation

### Adaptive Risk Management

1. **Evolution Risks**:
   - Risks to adaptation process itself
   - Mitigation strategies that evolve with new information
   - Contingency plans for failed adaptations

2. **Context Transition Risks**:
   - Risks during context switching
   - Mitigation for rapid or unexpected context changes
   - Fallback strategies for context transition failures

3. **Learning System Risks**:
   - Risks from incorrect learning or adaptation
   - Validation mechanisms for learning outcomes
   - Human oversight requirements for critical adaptations

## Quality Assurance for Adaptive Systems

### Adaptive Validation Strategies

1. **Dynamic Testing**:
   - Testing strategies that account for change
   - Validation methods for evolving components
   - Quality gates that adjust to new requirements

2. **Context-Sensitive Validation**:
   - Different validation criteria for different contexts
   - Validation during context transitions
   - Consistency checks across contexts

3. **Evolution Monitoring**:
   - Tracking adaptation effectiveness
   - Quality metrics that evolve with requirements
   - Alerting for adaptation failures

## Learning & Improvement Mechanisms

### Continuous Improvement

1. **Implementation Learning**:
   - How implementation process learns from experience
   - Feedback loops between implementation and design
   - Continuous improvement mechanisms

2. **Knowledge Accumulation**:
   - How lessons learned are captured and reused
   - Institutional knowledge about adaptation
   - Best practices for adaptive implementation

3. **Adaptive Process Improvement**:
   - How the planning process itself improves
   - Evolution of planning methodologies
   - Learning from plan execution outcomes

## Key rules

- Plan for adaptation throughout the implementation
- Include context-aware execution strategies
- Build in learning and feedback mechanisms
- ERROR on plans that don't accommodate evolution
