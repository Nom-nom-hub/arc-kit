# Adaptive Implementation Plan: [FEATURE]

**Branch**: `[###-feature-name]` | **Date**: [DATE] | **Spec**: [link]
**Input**: Adaptive feature specification from `/specs/[###-feature-name]/spec.md`
**Evolution Strategy**: [Reference to how this plan will adapt to changing requirements]
**Context Map**: [List of all environments and contexts this implementation must support]

**Note**: This template is filled in by the `/arckit.plan` command. See `.arc/templates/commands/plan.md` for the execution workflow.

## Summary

[Extract from adaptive feature spec: primary requirement + adaptive technical approach from research + evolution strategy]

## Adaptive Technical Context

<!--
  ACTION REQUIRED: Replace the content in this section with the adaptive technical details
  for the project. The structure here is presented in advisory capacity to guide
  the adaptive iteration process.
  Consider: How will these technical decisions need to change as requirements evolve?
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

- **Context Detection**: [How the system detects context changes with evolution considerations]
- **Adaptation Engine**: [What mechanism drives adaptation with extensibility for new strategies]
- **Feedback Processing**: [How user feedback is incorporated with learning algorithms]
- **Evolution Management**: [How the system evolves over time with migration strategies]
- **Configuration Management**: [How adaptive configuration is managed across contexts]
- **Monitoring & Observability**: [How adaptation effectiveness is measured and monitored]

**Evolution Planning Infrastructure**:

- **Schema Evolution Tools**: [How data schemas will evolve over time]
- **API Evolution Strategy**: [How APIs will adapt to changing requirements]
- **Dependency Update Plan**: [How external dependencies will be updated without breaking changes]
- **Backward Compatibility Layer**: [How existing functionality will be preserved during evolution]

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

[Gates determined based on adaptive constitution file with adaptation constraints]

## Adaptive Project Structure

### Documentation (this feature)

```text
specs/[###-feature]/
├── plan.md              # This file (/arckit.plan command output)
├── research.md          # Phase 0 output (/arckit.plan command) - includes evolution research
├── data-model.md        # Phase 1 output (/arckit.plan command) - includes schema evolution plans
├── quickstart.md        # Phase 1 output (/arckit.plan command) - includes context setup
├── contracts/           # Phase 1 output (/arckit.plan command) - includes evolution contract definitions
├── architecture/        # Phase 1 output - adaptive architecture diagrams and decisions
├── evolution/           # Phase 1 output - evolution scenarios and migration plans
├── tasks.md             # Phase 2 output (/arckit.tasks command) - includes evolution tasks
└── checklists/          # Quality and adaptation validation checklists
```

### Source Code (repository root)
<!--
  ACTION REQUIRED: Replace the placeholder tree below with the concrete adaptive layout
  for this feature. Delete unused options and expand the chosen structure with
  real adaptive paths. The delivered plan must not include Option labels.
  Consider: How will this structure need to evolve to accommodate changing requirements?
-->

```text
# [REMOVE IF UNUSED] Option 1: Adaptive Single project (DEFAULT)
src/
├── models/              # Adaptive models that can evolve
│   ├── entities/        # Core entities with evolution capabilities
│   ├── adapters/        # Context adapters and data transformation with schema evolution
│   └── evolution/       # Schema migration and evolution logic
├── services/            # Adaptive services with context awareness
│   ├── adaptation/      # Core adaptation engine with strategy extensibility
│   ├── context/         # Context detection and management
│   ├── feedback/        # Feedback processing services with learning capabilities
│   └── evolution/       # Service evolution and migration logic
├── api/                 # Adaptable API layer with versioning and evolution support
├── ui/                  # Adaptive user interface with context awareness
├── config/              # Adaptive configuration with context-specific overrides
├── utils/               # Adaptive utility libraries with evolution patterns
├── core/                # Core adaptation logic and strategy management
└── cli/                 # Adaptive command-line interface with evolution commands

tests/
├── contract/            # Context-aware contract tests for adaptation contracts
├── integration/         # Integration tests across contexts and evolution scenarios
├── adaptation/          # Adaptation-specific tests for context switching
├── evolution/           # Evolution-specific tests for schema and feature migration
├── context/             # Context switching and management tests
└── unit/                # Unit tests for all components including adaptation logic

config/
├── contexts/            # Context-specific configuration with fallbacks
├── adaptation/          # Adaptation strategy configuration
├── evolution/           # Evolution pathway configuration and migration settings
└── monitoring/          # Monitoring and observability configuration for adaptation metrics

scripts/
├── evolve/              # Scripts for feature evolution and migration
├── context/             # Scripts for context detection and switching
├── monitor/             # Scripts for adaptation monitoring and reporting
└── test/                # Scripts for adaptive testing across contexts

# [REMOVE IF UNUSED] Option 2: Adaptive Web application (when "frontend" + "backend" detected)
backend/
├── src/
│   ├── models/
│   ├── services/
│   ├── api/
│   ├── adaptation/      # Backend adaptation components
│   └── migrations/      # Schema evolution and data migration
├── tests/
├── config/
└── scripts/

frontend/
├── src/
│   ├── components/      # Adaptive UI components with context awareness
│   ├── pages/           # Context-aware page layouts
│   ├── services/        # Frontend context services
│   ├── adaptation/      # Frontend adaptation logic
│   └── context/         # Frontend context management
├── tests/
├── config/
└── scripts/

# [REMOVE IF UNUSED] Option 3: Adaptive Mobile + API (when "iOS/Android" detected)
api/
└── [same as adaptive backend above]

ios/ or android/
└── [adaptive platform-specific structure: adaptive feature modules, context-aware UI flows, adaptive platform tests, evolution capabilities]
```

**Structure Decision**: [Document the selected adaptive structure and reference the real directories captured above with adaptation considerations, including how this structure will evolve over time]

## Adaptive Complexity Tracking

> **Fill ONLY if Constitution Check has violations that must be justified**
> **Consider**: How does this complexity affect the system's ability to evolve?

| Violation | Why Needed | Simpler Alternative Rejected Because | Adaptation Impact | Evolution Impact |
|-----------|------------|-------------------------------------|-------------------|-------------------|
| [e.g., 4th adaptive component] | [current adaptation need] | [why 3 components insufficient for adaptation] | [how this affects adaptation] | [how this affects evolution and maintenance] |
| [e.g., Advanced adaptation pattern] | [specific adaptive problem] | [why simple adaptation insufficient] | [adaptive impact] | [how this impacts future evolution] |

## Adaptation Architecture

### Core Adaptation Patterns

- **Pattern 1**: [Adaptive Strategy Pattern - How different strategies are selected and applied]
- **Pattern 2**: [Context Observer Pattern - How context changes are detected and responded to]
- **Pattern 3**: [Adaptive Configuration Pattern - How configuration varies by context]
- **Pattern 4**: [Evolution Pipeline Pattern - How features are evolved safely]

### Context Management Architecture

- **Context Types**: [What contexts the system needs to detect and respond to]
- **Context Detection**: [How contexts are detected - environment variables, runtime checks, external signals]
- **Context Switching**: [How the system switches between different contexts safely]
- **Context Persistence**: [How context state is maintained across sessions]
- **Context Isolation**: [How different contexts are kept isolated from each other]

### Adaptation Engine Design

- **Engine Core**: [The main adaptation engine that drives all adaptive behavior]
- **Strategy Registry**: [How different adaptation strategies are registered and managed]
- **Feedback Loop**: [How adaptation effectiveness is measured and improved]
- **Safety Mechanisms**: [How adaptations are validated before application]

### Evolution Architecture

- **Schema Evolution**: [How data schemas evolve without breaking existing functionality]
- **API Versioning**: [How APIs evolve while maintaining backward compatibility]
- **Feature Flags**: [How new features are introduced behind adaptive flags]
- **Migration Framework**: [How data and configurations are migrated between versions]

## Evolution Pathways

### Short-term Evolution (0-6 months)

- **Pathway 1**: [How the system adapts to immediate requirement changes]
- **Pathway 2**: [How performance and scalability evolve with usage]
- **Pathway 3**: [How user experience evolves based on feedback]

### Medium-term Evolution (6-18 months)

- **Pathway 1**: [How architecture adapts to scale and complexity growth]
- **Pathway 2**: [How integration patterns evolve with new dependencies]
- **Pathway 3**: [How security and compliance adapt to changing requirements]

### Long-term Evolution (18+ months)

- **Pathway 1**: [How the system transforms to support new business models]
- **Pathway 2**: [How technology stack evolves to support new capabilities]
- **Pathway 3**: [How the adaptation engine itself evolves to support new patterns]

## Adaptive Risk Management

### Adaptation Risks

- **Risk 1**: [Adaptation failure risk - system fails to adapt to context changes] - Mitigation: [fallback strategies and graceful degradation]
- **Risk 2**: [Context switching failure - incorrect behavior in wrong context] - Mitigation: [context validation and state management]
- **Risk 3**: [Adaptation learning bias - system adapts to wrong patterns] - Mitigation: [bias detection and correction mechanisms]

### Evolution Risks

- **Risk 1**: [Schema migration failure - data corruption during evolution] - Mitigation: [backup strategies and migration testing]
- **Risk 2**: [Backward compatibility break - existing users affected by changes] - Mitigation: [deprecated path maintenance and migration tools]
- **Risk 3**: [Performance degradation - adaptation overhead impacts performance] - Mitigation: [adaptive optimization and caching]

### Monitoring and Feedback

- **Adaptation Metrics**: [What metrics will be tracked to measure adaptation effectiveness]
- **Context Switching Logs**: [What logging will capture context changes and responses]
- **Evolution Tracking**: [How evolution decisions and outcomes will be recorded and analyzed]
- **Performance Monitoring**: [How adaptation overhead will be measured and optimized]
