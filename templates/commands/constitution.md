---
description: Establish adaptive governance principles using dynamic reasoning chains and context-aware institutional learning.
handoffs:
  - label: Apply Adaptive Principles
    agent: arckit.define
    prompt: Apply constitution principles to feature specification...
  - label: Update Governance Framework
    agent: arckit.plan
    prompt: Plan for governance improvements based on constitution
    send: true
scripts:
  sh: scripts/bash/create-new-feature.sh --json "{ARGS}"
  ps: scripts/powershell/create-new-feature.ps1 -Json "{ARGS}"
---

# User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

1. **Setup**: Run `{SCRIPT}` from repo root and parse JSON for CONSTITUTION_FILE, GOVERNANCE_DIR, BRANCH. For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot' (or double-quote if possible: "I'm Groot").

2. **Load context**: Read existing `.arc/memory/constitution.md` if available, otherwise start fresh. Load CONSTITUTION_FILE template.

3. **Execute adaptive constitution workflow**:
   - Define Core Adaptive Principles
   - Establish Adaptive Governance Framework  
   - Create Reasoning Chain Protocols
   - Design Evolution Framework Implementation
   - Implement Context Integration Standards
   - Build Learning & Improvement Systems

4. **Adaptive Governance Validation**: Validate constitution against:
   - Organizational adaptability requirements
   - Context sensitivity needs
   - Multi-agent collaboration capabilities

5. **Generate Adaptive Governance Artifacts**: Create governance artifacts with:
   - Adaptive decision-making frameworks
   - Context-aware policy mechanisms
   - Learning and evolution protocols

## Core Principles of Adaptive Reasoning Chains

### Adaptive Behavioral Principles

1. **Principles Guiding Adaptive Behavior**:
   - Core principles that govern adaptive behavior
   - Values that remain consistent during evolution
   - Ethical guidelines for adaptive systems

2. **Evolution Integrity Principles**:
   - Principles that maintain system integrity during change
   - Consistency requirements across evolution paths
   - Stability requirements during adaptation

3. **Context Awareness Principles**:
   - Principles for appropriate context-sensitive behavior
   - Guidelines for context detection and response
   - Ethical considerations for context usage

## Adaptive Governance Framework

### Dynamic Decision-Making

1. **Adaptive Decision Authority**:
   - How decisions are made in evolving systems
   - Authority structures that adapt to context
   - Conflict resolution in dynamic environments

2. **Context-Sensitive Governance**:
   - Governance mechanisms that adapt to different contexts
   - Policy frameworks that adjust to environment
   - Authority delegation based on context

3. **Multi-Agent Coordination**:
   - How multiple agents collaborate in adaptive systems
   - Shared knowledge protocols
   - Coordination mechanisms across agents

## Reasoning Chain Protocols

### Chain Creation Standards

1. **Adaptive Chain Creation**:
   - Standards for creating reasoning chains
   - Protocols for multi-agent collaboration
   - Guidelines for traceability and accountability

2. **Chain Evolution Protocols**:
   - How reasoning chains evolve over time
   - Standards for chain modification
   - Quality criteria for chain updates

3. **Cross-Chain Coordination**:
   - How different reasoning chains interact
   - Consistency mechanisms between chains
   - Conflict resolution in chain interactions

## Evolution Framework Implementation

### System Evolution Governance

1. **Evolution Management Framework**:
   - Framework for managing system evolution
   - Standards for adaptation triggers
   - Quality criteria for evolutionary changes

2. **Change Readiness Assessment**:
   - How to assess if systems are ready for change
   - Criteria for evolutionary path selection
   - Risk assessment for evolution decisions

3. **Evolution Quality Gates**:
   - Quality checkpoints during evolution
   - Validation criteria for evolutionary changes
   - Rollback triggers for failed evolutions

## Context Integration Standards

### Environmental Adaptation

1. **Context Detection Standards**:
   - Principles for context awareness
   - Guidelines for environmental adaptation
   - Standards for context-sensitive behavior

2. **Context Transition Protocols**:
   - How to handle context transitions safely
   - Consistency requirements across contexts
   - Validation during context switching

3. **Context Boundary Management**:
   - How to define and manage context boundaries
   - Cross-context coordination requirements
   - Context isolation when needed

## Learning & Improvement Systems

### Continuous Improvement Framework

1. **Institutional Learning Principles**:
   - Principles for continuous learning
   - Mechanisms for institutional knowledge
   - Standards for methodology improvement

2. **Adaptive Knowledge Management**:
   - How knowledge adapts to new information
   - Learning from success and failure
   - Knowledge sharing across contexts

3. **Improvement Validation**:
   - How to validate improvement effectiveness
   - Standards for improvement assessment
   - Feedback integration for continuous improvement

## Key rules

- Constitution must support adaptation at all levels
- Include context-aware governance mechanisms
- Build in learning and institutional memory systems
- ERROR on principles that impede adaptation or learning
- **CRITICAL**: All implementations must meet quality and verification standards
- **CRITICAL**: Testing and validation are required for all deliverables
- **CRITICAL**: Code correctness and functionality verification are mandatory
- **CRITICAL**: Dependencies must be validated before project completion

## Next Step Recommendation

Now that your project constitution is established, the most logical next step is:

- **Primary**: Run `/arckit.define` to create your first feature specification guided by the governance principles you've established
- **Alternative**: Use the constitution as reference in future commands to maintain consistency

The `/arckit.define` command will create feature specifications that align with the adaptive principles and governance framework you've defined.

**Pro tip**: All future development should refer back to these constitution principles to ensure consistency and alignment with your governance standards.
