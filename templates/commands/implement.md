---
description: Execute adaptive implementation using dynamic reasoning chains and context-aware deployment strategies.
handoffs:
  - label: Create Adaptive Testing Plan
    agent: arckit.checklist
    prompt: Create adaptive quality assurance checklist...
  - label: Update Adaptive Architecture
    agent: arckit.design
    prompt: Update architecture based on implementation learning
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

1. **Setup**: Run `{SCRIPT}` from repo root and parse JSON for TASKS_FILE, IMPLEMENTATION_DIR, SPECS_DIR, BRANCH. For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot' (or double-quote if possible: "I'm Groot").

2. **Load context**: Read TASKS_FILE, PLAN_FILE, DESIGN_FILE, SPEC_FILE, and `.arc/memory/constitution.md`.

3. **Execute adaptive implementation workflow**:
   - Initialize Adaptive Implementation Environment
   - Execute Context-Sensitive Implementation Tasks
   - Apply Evolution Management Techniques
   - Integrate Reasoning Chain Logic
   - **CRITICAL**: Implement comprehensive testing strategy (unit, integration, system tests)
   - **CRITICAL**: Verify all functionality works as specified before completion
   - **CRITICAL**: Validate dependencies and third-party integrations
   - Perform Quality Assurance for Adaptive Systems
   - Establish Monitoring & Feedback Systems

4. **Adaptive Implementation Validation**: Validate implementation against:
   - Adaptation requirements from upstream artifacts
   - Context switching capabilities
   - Evolution pathway implementations
   - **CRITICAL**: Functional correctness - all implemented features must work as specified
   - **CRITICAL**: Code quality standards - all code must be clean, documented, and maintainable
   - **CRITICAL**: Test coverage - all critical paths must have automated tests with >=80% coverage
   - **CRITICAL**: Dependency validation - all dependencies must be verified and working
   - **CRITICAL**: Performance requirements - must meet specified performance criteria
   - **CRITICAL**: Error handling - must gracefully handle edge cases and error conditions

5. **Generate Adaptive Implementation Artifacts**: Create implementation artifacts with:
   - Adaptive configuration files
   - Context-aware deployment mechanisms
   - Learning and feedback systems

## Implementation Approach

### Adaptive System Implementation

1. **Context-Sensitive Implementation**:
   - Implementation strategies that adapt to different contexts
   - Environmental configuration management
   - Dynamic behavior based on context detection

2. **Evolution-Ready Code Structure**:
   - Code organization supporting dynamic changes
   - Interfaces designed for adaptation
   - Configuration mechanisms for context sensitivity

3. **Adaptive Architecture Implementation**:
   - How to implement the adaptive architecture design
   - Context switching mechanisms
   - Dynamic component loading and configuration

## Reasoning Chain Integration

### Implementation Decision Integration

1. **Decision Traceability Implementation**:
   - How implementation decisions connect to reasoning chains
   - Traceability systems between code and specifications
   - Documentation of implementation rationale in code

2. **Adaptive Logic Implementation**:
   - How reasoning chains are implemented in code
   - Decision trees with multiple context branches
   - Logic flows that adapt to changing conditions

3. **Knowledge Integration Systems**:
   - How implementation builds on institutional knowledge
   - Learning from similar implementations
   - Knowledge sharing between implementations

## Evolution Management

### Code Evolution Implementation

1. **Adaptive Versioning**:
   - How to manage code evolution over time
   - Versioning strategies for adaptive systems
   - Deployment considerations for changing systems

2. **Dynamic Configuration**:
   - Configuration systems that adapt to context
   - Runtime configuration updates
   - Context-based feature toggles

3. **Evolution Safety Mechanisms**:
   - Safeguards during system evolution
   - Rollback mechanisms for failed adaptations
   - Consistency during evolution transitions

## Quality Assurance for Adaptive Systems

### Testing Adaptive Systems

1. **Context-Aware Testing**:
   - Testing strategies for evolving codebases
   - Context-specific test cases
   - Validation of adaptation mechanisms

2. **Adaptive Test Generation**:
   - Tests that evolve with the system
   - Dynamic test case generation
   - Context-sensitive test execution

3. **Evolution Validation**:
   - Validation of adaptation effectiveness
   - Quality gates that adjust to new requirements
   - Continuous validation during evolution

## Monitoring & Feedback

### Runtime Adaptation Monitoring

1. **Adaptive System Monitoring**:
   - Runtime monitoring of adaptation behavior
   - Context switching tracking
   - Performance monitoring during evolution

2. **Feedback Collection Systems**:
   - How to collect feedback for improvement
   - User behavior monitoring for adaptation
   - System performance feedback for learning

3. **Adaptive Performance Tracking**:
   - Performance metrics that evolve with requirements
   - Context-aware performance thresholds
   - Learning from performance data

## Key rules

- Implementation must support adaptation from the ground up
- Include context detection and switching mechanisms
- Build in learning and improvement systems
- ERROR on implementations that don't accommodate evolution
- All code must be functionally correct, tested, and verifiable before completion
- Implementation must include automated tests that verify functionality
- All dependencies and requirements must be validated as working
- Implementation must be verifiable through automated or manual testing procedures

## Next Step Recommendation

Now that your adaptive implementation is complete, the most logical next step is:

- **Primary**: Run `/arckit.checklist` to create an adaptive quality assurance checklist for your implementation
- **Alternative**: Return to `/arckit.define` for the next feature, incorporating lessons learned

The `/arckit.checklist` command will create quality assurance measures to validate your implementation against the original requirements and adaptation goals.

**Pro tip**: Use the monitoring and feedback systems you built into your implementation to inform future development cycles and improvement efforts.
