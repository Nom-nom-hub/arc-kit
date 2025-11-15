# Adaptive Implementation Plan: [FEATURE]

**Branch**: `[###-feature-name]` | **Date**: [DATE] | **Spec**: [link]
**Input**: Adaptive feature specification from `/specs/[###-feature-name]/spec.md`

**Note**: This template is filled in by the `/arckit.plan` command. See `.arckit/templates/commands/plan.md` for the execution workflow.

## Summary

[Extract from adaptive feature spec: primary requirement + adaptive technical approach from research]

## Adaptive Technical Context

<!--
  ACTION REQUIRED: Replace the content in this section with the adaptive technical details
  for the project. The structure here is presented in advisory capacity to guide
  the adaptive iteration process.
-->

**Language/Version**: [e.g., Python 3.11 with adaptation libraries, Swift 5.9, Rust 1.75 or NEEDS CLARIFICATION]
**Primary Adaptive Dependencies**: [e.g., FastAPI with adaptation middleware, adaptive UI frameworks, ML libraries or NEEDS CLARIFICATION]
**Adaptive Storage**: [if applicable, e.g., PostgreSQL with schema evolution, adaptive data stores, files or N/A]
**Adaptive Testing**: [e.g., pytest with context-aware tests, adaptive test frameworks or NEEDS CLARIFICATION]
**Target Platform**: [e.g., Linux server with auto-scaling, iOS 15+ with context awareness, adaptive cloud or NEEDS CLARIFICATION]
**Project Type**: [single/web/mobile - determines adaptive source structure]
**Performance Goals**: [domain-specific and context-aware, e.g., "1000 req/s normally, 1500 during peak with adaptive scaling" or NEEDS CLARIFICATION]
**Adaptation Constraints**: [domain-specific, e.g., <200ms p95 adaptive response, <100MB memory with context awareness, offline-capable with sync or NEEDS CLARIFICATION]
**Scale/Scope**: [domain-specific, e.g., 10k users adapting to 100k, 1M LOC with evolution, 50 screens with adaptive UI or NEEDS CLARIFICATION]

**Adaptation Infrastructure**:

- **Context Detection**: [How the system detects context changes]
- **Adaptation Engine**: [What mechanism drives adaptation]
- **Feedback Processing**: [How user feedback is incorporated]
- **Evolution Management**: [How the system evolves over time]

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

[Gates determined based on adaptive constitution file with adaptation constraints]

## Project Structure

### Documentation (this feature)

```text
specs/[###-feature]/
├── plan.md              # This file (/arckit.plan command output)
├── research.md          # Phase 0 output (/arckit.plan command) 
├── data-model.md        # Phase 1 output (/arckit.plan command)
├── quickstart.md        # Phase 1 output (/arckit.plan command)
├── contracts/           # Phase 1 output (/arckit.plan command)
└── tasks.md             # Phase 2 output (/arckit.chain command - NOT created by /arckit.plan)
```

### Source Code (repository root)
<!--
  ACTION REQUIRED: Replace the placeholder tree below with the concrete adaptive layout
  for this feature. Delete unused options and expand the chosen structure with
  real adaptive paths. The delivered plan must not include Option labels.
-->

```text
# [REMOVE IF UNUSED] Option 1: Adaptive Single project (DEFAULT)
src/
├── models/              # Adaptive models that can evolve
│   ├── entities/        # Core entities with evolution capabilities
│   └── adapters/        # Context adapters and data transformation
├── services/            # Adaptive services with context awareness
│   ├── adaptation/      # Core adaptation engine
│   ├── context/         # Context detection and management
│   └── feedback/        # Feedback processing services
├── cli/                 # Adaptive command-line interface
└── lib/                 # Adaptive utility libraries

tests/
├── contract/            # Context-aware contract tests
├── integration/         # Integration tests across contexts
├── adaptation/          # Adaptation-specific tests
└── unit/                # Unit tests for adaptive components

config/
├── contexts/            # Context-specific configuration
├── adaptation/          # Adaptation strategy configuration
└── evolution/           # Evolution pathway configuration

# [REMOVE IF UNUSED] Option 2: Adaptive Web application (when "frontend" + "backend" detected)
backend/
├── src/
│   ├── models/
│   ├── services/
│   ├── api/
│   └── adaptation/      # Backend adaptation components
└── tests/

frontend/
├── src/
│   ├── components/      # Adaptive UI components
│   ├── pages/           # Context-aware page layouts
│   ├── services/        # Frontend context services
│   └── adaptation/      # Frontend adaptation logic
└── tests/

# [REMOVE IF UNUSED] Option 3: Adaptive Mobile + API (when "iOS/Android" detected)
api/
└── [same as adaptive backend above]

ios/ or android/
└── [adaptive platform-specific structure: adaptive feature modules, context-aware UI flows, adaptive platform tests]
```

**Structure Decision**: [Document the selected adaptive structure and reference the real directories captured above with adaptation considerations]

## Adaptive Complexity Tracking

> **Fill ONLY if Constitution Check has violations that must be justified**

| Violation | Why Needed | Simpler Alternative Rejected Because | Adaptation Impact |
|-----------|------------|-------------------------------------|-------------------|
| [e.g., 4th adaptive component] | [current adaptation need] | [why 3 components insufficient for adaptation] | [how this affects adaptation] |
| [e.g., Advanced adaptation pattern] | [specific adaptive problem] | [why simple adaptation insufficient] | [adaptive impact] |

## Adaptation Planning

### Adaptation Strategies

- **Strategy 1**: [How the system adapts to [context type]]
- **Strategy 2**: [How the system evolves based on [evolution trigger]]
- **Strategy 3**: [How the system learns from [feedback type]]

### Context Management

- **Context Types**: [What contexts the system needs to detect and respond to]
- **Context Switching**: [How the system switches between different contexts]
- **Context Persistence**: [How context state is maintained]

### Evolution Pathways

- **Pathway 1**: [How the system evolves from [state] to [improved state]]
- **Pathway 2**: [How adaptation mechanisms themselves improve over time]
- **Evolution Metrics**: [How to measure successful evolution]

## Adaptive Risk Management

- **Risk 1**: [Adaptation failure risk] - Mitigation: [how to prevent]
- **Risk 2**: [Context switching failure] - Mitigation: [fallback strategy]
- **Risk 3**: [Learning algorithm bias] - Mitigation: [bias detection and correction]
