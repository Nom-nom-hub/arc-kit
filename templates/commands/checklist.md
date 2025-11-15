---
description: Generate adaptive checklists using dynamic reasoning chains and context-aware quality assurance.
handoffs:
  - label: Execute Quality Verification
    agent: arckit.implement
    prompt: Verify implementation against adaptive checklist...
  - label: Update Quality Framework
    agent: arckit.analyze
    prompt: Analyze quality assurance effectiveness
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

1. **Setup**: Run `{SCRIPT}` from repo root and parse JSON for CHECKLIST_FILE, QUALITY_DIR, BRANCH. For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot' (or double-quote if possible: "I'm Groot").

2. **Load context**: Read upstream artifacts (SPEC_FILE, DESIGN_FILE, PLAN_FILE, IMPLEMENTATION_ARTIFACTS), and `.arckit/memory/constitution.md`. Load CHECKLIST_FILE template.

3. **Execute adaptive checklist workflow**:
   - Generate Context-Aware Quality Criteria
   - Create Evolution-Ready Validation Items
   - Build Adaptive Compliance Checks
   - Design Feedback-Driven Quality Assessment
   - **CRITICAL**: Generate comprehensive testing checklists (unit, integration, system)
   - **CRITICAL**: Create functionality verification items for all features
   - **CRITICAL**: Include dependency and integration validation items
   - **CRITICAL**: Add error handling and edge case verification items
   - Implement Learning-Based Quality Improvement
   - Establish Dynamic Quality Thresholds

4. **Adaptive Checklist Validation**: Validate checklist against:
   - Context sensitivity requirements
   - Adaptation validation needs
   - Quality assurance evolution pathways

5. **Generate Adaptive Quality Artifacts**: Create quality artifacts with:
   - Context-sensitive validation criteria
   - Evolution-aware quality metrics
   - Learning-enhanced quality standards

## Context-Aware Quality Criteria

### Adaptive Quality Standards

1. **Context-Sensitive Validation**:
   - Quality criteria that adapt to different contexts
   - Different validation standards for different environments
   - Context-appropriate quality thresholds

2. **Dynamic Quality Assessment**:
   - Quality measures that evolve with requirements
   - Adaptive quality gates that adjust to context
   - Context-aware quality metrics

3. **Cross-Context Consistency**:
   - Maintaining quality consistency across contexts
   - Validation of context switching quality
   - Quality standards for context transitions

## Evolution-Ready Validation

### Quality During Evolution

1. **Adaptive Validation Criteria**:
   - Validation items that can evolve with the system
   - Quality checks that adapt to changing requirements
   - Evolution pathway quality verification

2. **Change Impact Assessment**:
   - How changes affect quality in different contexts
   - Validation of evolution effectiveness
   - Quality impact of adaptive changes

3. **Quality Evolution Tracking**:
   - Tracking quality metrics during evolution
   - Historical quality assessment for improvements
   - Quality trend analysis across adaptations

## Adaptive Compliance Checks

### Context-Sensitive Compliance

1. **Dynamic Compliance Requirements**:
   - Compliance standards that adapt to context
   - Different compliance levels for different contexts
   - Adaptive regulatory compliance checking

2. **Evolution Compliance**:
   - Ensuring compliance during evolution
   - Compliance validation for adaptation mechanisms
   - Regulatory impact of adaptive systems

3. **Multi-Context Compliance**:
   - Compliance across different operational contexts
   - Context transition compliance validation
   - Cross-context compliance consistency

## Feedback-Driven Quality Assessment

### Learning-Based Quality

1. **Quality Feedback Integration**:
   - How to integrate quality feedback into systems
   - Quality metrics based on user feedback
   - Adaptive quality improvement from experience

2. **Performance Learning**:
   - Learning from quality successes and failures
   - Quality validation based on performance
   - Adaptive quality adjustment from outcomes

3. **Continuous Quality Improvement**:
   - How quality standards improve over time
   - Quality learning from similar projects
   - Institutional quality knowledge building

## Learning-Based Quality Improvement

### Adaptive Quality Enhancement

1. **Quality Learning Systems**:
   - How quality assessments learn from results
   - Quality metrics that improve with experience
   - Adaptive quality standards from best practices

2. **Quality Evolution Mechanisms**:
   - How quality standards evolve with requirements
   - Quality improvement based on adaptation outcomes
   - Learning from quality validation results

3. **Institutional Quality Knowledge**:
   - Building institutional quality knowledge
   - Quality standards based on organizational learning
   - Quality improvement across projects

## Dynamic Quality Thresholds

### Threshold-Based Quality Adaptation

1. **Context-Adaptive Thresholds**:
   - Quality thresholds that adjust to context
   - Different standards for different operational contexts
   - Dynamic quality requirements based on environment

2. **Evolution-Aware Thresholds**:
   - Quality thresholds that adapt during evolution
   - Threshold adjustments based on adaptation effectiveness
   - Quality standards for evolutionary phases

3. **Performance-Based Thresholds**:
   - Quality thresholds based on system performance
   - Adaptive standards from performance learning
   - Threshold evolution based on results

## Key rules

- Checklists must be adaptive and context-aware
- Include evolution validation for all quality measures
- Build in learning and improvement mechanisms
- ERROR on checklists that don't accommodate adaptation
- **CRITICAL**: Checklists must include comprehensive testing verification items
- **CRITICAL**: Checklists must validate all functionality works as specified
- **CRITICAL**: Checklists must include dependency and integration verification
- **CRITICAL**: Checklists must verify error handling and edge cases

## Next Step Recommendation

Now that your adaptive checklist is complete, the most logical next step is:

- **Primary**: Use the checklist to verify your implementation (either go back to `/arckit.implement` or execute verification tasks manually)
- **Alternative**: Return to `/arckit.define` for the next feature, using this checklist as a quality reference

The adaptive checklist you've created should guide quality assurance for your current implementation and serve as a reference for future development.

**Pro tip**: The quality criteria you've defined will help ensure your adaptive systems maintain quality across different contexts and evolution paths.
