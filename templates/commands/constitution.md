---
description: Establish adaptive project principles and evolution-focused success metrics for iterative development with context-aware governance.
handoffs:
  - label: Apply Adaptive Project Principles
    agent: arckit.define
    prompt: Apply adaptive project principles to feature specification with evolution considerations...
  - label: Reference Adaptive Project Principles
    agent: arckit.plan
    prompt: Reference adaptive project principles when planning implementation with evolution strategies
    send: true
scripts:
  sh: scripts/bash/create-new-project.sh --json "{ARGS}"
  ps: scripts/powershell/create-new-project.ps1 -Json "{ARGS}"
---

# User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

1. **Setup**: Run `{SCRIPT}` from repo root and parse JSON for CONSTITUTION_FILE, PROJECT_DIR, BRANCH. For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot' (or double-quote if possible: "I'm Groot").

2. **Load adaptive context**: Read existing `.arc/memory/constitution.md` if available, otherwise start fresh. Load CONSTITUTION_FILE template. Consider:
   - Existing project patterns and practices
   - Context-specific requirements and constraints
   - Evolution and adaptation patterns from similar projects
   - Quality standards and governance requirements

3. **Execute adaptive constitution workflow**:
   - Define Core Project Principles
   - Establish Success Metrics
   - Create Decision-Making Guidelines
   - Design Quality Standards
   - Set Communication Protocols

4. **Project Governance Validation**: Validate constitution against:
   - Team collaboration requirements
   - Quality standards
   - Iteration planning capabilities

5. **Generate Project Artifacts**: Create governance artifacts with:
   - Clear decision-making frameworks
   - Quality and testing standards
   - Iteration and feedback protocols

## Core Project Principles

### Project Values

1. **Practical Development**:
   - Focus on working software over extensive documentation
   - Emphasize iterative progress over perfection
   - Prioritize clear communication and collaboration

2. **Quality Focus**:
   - Maintain high standards for code quality and testing
   - Ensure requirements are clear and testable
   - Build in quality checks throughout development

3. **Adaptability**:
   - Build systems that can evolve based on feedback
   - Allow for requirement changes during development
   - Maintain flexibility in implementation approaches

## Success Metrics

### Project Success Criteria

1. **Delivery Metrics**:
   - Features delivered according to defined requirements
   - Quality standards consistently met
   - Stakeholder satisfaction with delivered functionality

2. **Quality Metrics**:
   - Code quality and maintainability standards
   - Test coverage and reliability
   - Performance and security requirements met

3. **Process Metrics**:
   - Iteration completion rates
   - Time from requirement to delivery
   - Feedback incorporation effectiveness

## Decision-Making Guidelines

### Technical Decisions

1. **Technology Selection**:
   - Choose technologies based on project requirements
   - Consider team expertise and long-term maintainability
   - Balance innovation with stability

2. **Architecture Decisions**:
   - Design for maintainability and testing
   - Consider scalability and performance needs
   - Plan for future evolution and extension

3. **Quality Standards**:
   - Define clear testing requirements
   - Establish code review processes
   - Set performance and security standards

## Quality Standards

### Code Quality

1. **Code Review Requirements**:
   - All code changes require review
   - Clear acceptance criteria for merge
   - Focus on maintainability and correctness

2. **Testing Standards**:
   - All features must have appropriate tests
   - Performance testing where applicable
   - Security considerations addressed

3. **Documentation Requirements**:
   - Clear documentation for complex features
   - API documentation for external interfaces
   - Architectural decisions documented

## Communication Protocols

### Team Communication

1. **Progress Updates**:
   - Regular updates on feature progress
   - Clear identification of blockers
   - Transparent reporting of challenges

2. **Feedback Integration**:
   - Structured approach to feedback collection
   - Clear process for feedback prioritization
   - Regular review meetings

## Key rules

- Constitution must support practical development workflows
- Include clear quality and testing standards
- Build in feedback and iteration mechanisms
- ERROR on principles that impede practical development
- **CRITICAL**: All implementations must meet quality and verification standards
- **CRITICAL**: Testing and validation are required for all deliverables
- **CRITICAL**: Code correctness and functionality verification are mandatory
- **CRITICAL**: Dependencies must be validated before project completion

## Next Step Recommendation

Now that your project constitution is established, the most logical next step is:

- **Primary**: Run `/arckit.define` to create your first feature specification guided by the principles you've established
- **Alternative**: Use the constitution as reference in future commands to maintain consistency

The `/arckit.define` command will create feature specifications that align with the project principles and quality standards you've defined.

**Pro tip**: All future development should refer back to these constitution principles to ensure consistency and alignment with project standards.
