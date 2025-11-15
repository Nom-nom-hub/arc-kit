---
description: Execute adaptive architecture design using dynamic reasoning chains and context-aware design patterns.
handoffs:
  - label: Create Adaptive Implementation Plan
    agent: arckit.plan
    prompt: Create an adaptive implementation plan based on the design...
  - label: Generate Adaptive Tasks
    agent: arckit.chain
    prompt: Generate adaptive task chains for the design
    send: true
scripts:
  sh: scripts/bash/setup-design.sh --json
  ps: scripts/powershell/setup-design.ps1 -Json
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

1. **Setup**: Run `{SCRIPT}` from repo root and parse JSON for SPEC_FILE, DESIGN_FILE, SPECS_DIR, BRANCH. For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot' (or double-quote if possible: "I'm Groot").

2. **Load context**: Read SPEC_FILE, ANALYSIS_FILE, and `.arckit/memory/constitution.md`. Load DESIGN_FILE template (already copied).

3. **Execute adaptive design workflow**: Follow the structure in DESIGN_FILE template to:
   - Fill System Architecture with evolution capabilities
   - Fill Context-Aware Design Elements
   - Generate Evolution-Ready Patterns
   - Define Adaptive Infrastructure
   - **CRITICAL**: Design for testability (ensure all components can be tested)
   - **CRITICAL**: Create testable interfaces and modules
   - **CRITICAL**: Design verification and validation architecture
   - Create Reasoning Chain Integration
   - Assess Quality Attributes for adaptive systems

4. **Adaptive Design Validation**: Validate design against:
   - Adaptation requirements from spec
   - Context switching capabilities
   - Evolution pathway feasibility

5. **Generate Adaptive Components**: Create design artifacts that incorporate adaptation mechanisms:
   - Adaptive interfaces
   - Context-aware modules
   - Evolution-ready patterns
   - Learning mechanisms

## Adaptive Architecture Design

### System Architecture

1. **Core Adaptive Components**:
   - Components designed with evolution in mind
   - Interfaces that can adapt to changing requirements
   - Data flow patterns supporting dynamic behavior

2. **Context-Aware Elements**:
   - How the system responds to different contexts
   - Decision points based on environmental factors
   - Context detection and handling mechanisms

3. **Evolution-Ready Patterns**:
   - Design patterns that support dynamic evolution
   - Modular components with clear boundaries
   - Interfaces designed for future extension

### Adaptive Infrastructure

1. **Infrastructure that Adapts**:
   - Scalable resources that adjust to changing needs
   - Configuration management for different contexts
   - Monitoring for adaptation effectiveness

2. **Context Management**:
   - Context detection systems
   - Context switching mechanisms
   - Context-aware routing and processing

3. **Learning Systems**:
   - Feedback collection mechanisms
   - Data storage for learning
   - Analytics for improvement identification

## Reasoning Chain Integration

### Decision Traceability

- How design decisions connect to requirements
- Links between architecture choices and specification
- Justification for adaptive design choices

### Adaptive Reasoning

- How the system makes decisions in different contexts
- Logic flows that adapt to changing conditions
- Decision trees with multiple context branches

### Knowledge Integration

- How design decisions build on previous knowledge
- Learning from similar systems or contexts
- Institutional knowledge incorporation

## Quality Attributes for Adaptive Systems

### Performance in Dynamic Environments

- Performance considerations for changing contexts
- Resource allocation during adaptation
- Latency for context switching

### Security in Adaptive Systems

- Security during adaptation processes
- Authentication/authorization for changing contexts
- Vulnerability management for evolving systems

### Reliability During Evolution

- Maintaining reliability during changes
- Fallback mechanisms for failed adaptations
- Consistency across different contexts

### Maintainability of Changing Systems

- Managing code complexity in adaptive systems
- Documentation for evolving components
- Testing strategies for changing behavior

## Key rules

- Design for adaptation from the ground up
- Ensure context awareness at all levels
- Build in learning and improvement mechanisms
- ERROR on architecture decisions that impede adaptation

## Next Step Recommendation

Now that your adaptive design is complete, the most logical next step is:

- **Primary**: Run `/arckit.plan` to create an implementation plan based on your adaptive architecture
- **Alternative**: Run `/arckit.chain` to generate adaptive task chains directly from the design

The `/arckit.plan` command will create a detailed implementation plan that incorporates your adaptive architecture and evolution pathways.

**Pro tip**: The adaptive architecture you've designed will guide the planning process, ensuring implementation strategies align with your architectural decisions.
