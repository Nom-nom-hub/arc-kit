---
description: Execute adaptive analysis workflow using dynamic reasoning chains to evaluate specifications for adaptation readiness.
handoffs:
  - label: Create Adaptive Design
    agent: arckit.design
    prompt: Create an adaptive design based on analysis results...
  - label: Identify Adaptation Risks
    agent: arckit.plan
    prompt: Plan for identified risks and adaptation challenges
    send: true
scripts:
  sh: scripts/bash/analyze-spec.sh --json
  ps: scripts/powershell/analyze-spec.ps1 -Json
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

1. **Setup**: Run `{SCRIPT}` from repo root and parse JSON for SPEC_FILE, ANALYSIS_FILE, SPECS_DIR, BRANCH. For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot' (or double-quote if possible: "I'm Groot").

2. **Load context**: Read SPEC_FILE and `/memory/constitution.md`. Load ANALYSIS_FILE template (already copied).

3. **Execute adaptive analysis workflow**: Follow the structure in ANALYSIS_FILE template to:
   - Fill Context Analysis (environmental factors affecting specification)
   - Fill Adaptation Readiness Assessment (how well spec can evolve)
   - Identify Evolution Pathways (potential directions for change)
   - Generate Adaptive Validation Points (where to validate during evolution)

4. **Adaptive Risk Assessment**:
   - Identify risks to adaptation process
   - Assess context sensitivity of requirements
   - Evaluate feedback loop effectiveness

5. **Generate Reasoning Chains**: Create logical chains connecting:
   - Requirements to adaptation mechanisms
   - Contexts to behavioral changes
   - Risks to mitigation strategies

## Adaptive Analysis Components

### Context Analysis

1. **Environmental Factors**:
   - User contexts that may change
   - System contexts requiring adaptation
   - External contexts affecting behavior

2. **Constraint Analysis**:
   - Technical constraints that might limit adaptation
   - Business constraints affecting evolution
   - Regulatory constraints requiring compliance

3. **Opportunity Identification**:
   - Contexts where adaptation provides advantage
   - Areas for improvement through evolution
   - Opportunities for enhanced user experience

### Adaptation Readiness Assessment

1. **Flexibility Evaluation**:
   - How easily requirements can change
   - Component modularity for evolution
   - Interface adaptability for new contexts

2. **Feedback Readiness**:
   - Channels for receiving adaptation feedback
   - Metrics for measuring adaptation success
   - Mechanisms for incorporating learning

3. **Risk Assessment**:
   - Areas where adaptation could cause issues
   - Dependencies that might resist change
   - Critical components requiring careful evolution

## Adaptive Validation Points

### Evolution Validation

- Where to validate adaptation effectiveness
- Metrics for measuring successful evolution
- Warning signs of adaptation failure

### Context Validation

- How to validate context detection accuracy
- Mechanisms for ensuring context-appropriate behavior
- Fallback validation when context is unclear

### Learning Validation

- How to validate that system learns from experience
- Mechanisms for confirming improvement over time
- Quality gates for adaptive behavior

## Key rules

- Focus on adaptation capabilities and evolution readiness
- Identify context dependencies and switching mechanisms
- Assess feedback loop effectiveness
- ERROR on critical adaptation risks or context sensitivity issues
