---

description: "Adaptive task list template for feature implementation with reasoning chains, evolution planning, and context-aware execution"
---

# Adaptive Tasks: [FEATURE NAME]

**Input**: Adaptive design documents from `/specs/[###-feature-name]/`
**Prerequisites**: plan.md (required), spec.md (required for user stories), research.md, data-model.md, contracts/
**Evolution Context**: [Reference to evolution pathways and adaptation strategies from plan.md]

**Adaptive Tests**: The examples below include adaptive test tasks. Tests are OPTIONAL - only include them if explicitly requested in the adaptive feature specification. Adaptive tests should verify behavior across different contexts, adaptation effectiveness, and evolution scenarios.

**Organization**: Tasks are grouped by user story to enable independent implementation and testing of each story, with adaptive reasoning chains connecting decisions to outcomes and evolution planning integrated throughout.

## Format: `[ID] [P?] [Story] [Adapt] [Evolve] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this belongs to (e.g., US1, US2, US3)
- **[Adapt]**: Task involves adaptation logic (e.g., [ADAPT], [CONTEXT], [FEEDBACK])
- **[Evolve]**: Task involves evolution planning or schema changes (e.g., [EVOLVE], [MIGRATE])
- Include exact file paths in descriptions

## Adaptive Path Conventions

- **Adaptive Single project**: `src/`, `tests/`, `adaptation/`, `evolution/` at repository root
- **Adaptive Web app**: `backend/src/`, `frontend/src/`, `adaptation/`, `evolution/`
- **Adaptive Mobile**: `api/src/`, `ios/src/` or `android/src/`, `adaptation/`, `evolution/`
- Paths shown below assume adaptive single project - adjust based on plan.md structure

<!--
  ============================================================================
  IMPORTANT: The adaptive tasks below are SAMPLE TASKS for illustration only.

  The /arckit.tasks command MUST replace these with actual adaptive tasks based on:
  - Adaptive user stories from spec.md (with their priorities P1, P2, P3...)
  - Adaptive feature requirements from plan.md
  - Adaptive entities from data-model.md
  - Adaptive endpoints from contracts/
  - Reasoning chains that connect decisions to outcomes
  - Evolution pathways from plan.md and spec.md
  - Context requirements across different deployment environments

  Tasks MUST be organized by user story so each story can be:
  - Implemented independently
  - Tested independently across contexts and evolution scenarios
  - Delivered as an adaptive MVP increment
  - Adapted to changing requirements independently
  - Evolved with minimal disruption to other components

  DO NOT keep these sample tasks in the generated tasks.md file.
  ============================================================================
-->

## Phase 1: Adaptive Setup (Evolution-Ready Infrastructure)

**Purpose**: Adaptive project initialization with evolution planning and basic structure with reasoning chain foundation

- [ ] T001 [EVOLVE] Create adaptive project structure with evolution pathway planning in `/evolution/`
- [ ] T002 [ADAPT] Initialize [language] project with [adaptive framework] dependencies and evolution tools
- [ ] T003 [P] [ADAPT] Configure adaptive linting and formatting tools with evolution pattern recognition
- [ ] T004 [ADAPT] Setup reasoning chain logging and traceability infrastructure with evolution tracking
- [ ] T005 [ADAPT] Initialize context detection and management framework with configuration evolution support
- [ ] T006 [EVOLVE] Setup schema evolution tools and migration framework for future data changes
- [ ] T007 [EVOLVE] Configure version management and API evolution strategy infrastructure

---

## Phase 2: Adaptive Foundation (Blocking Prerequisites with Evolution)

**Purpose**: Adaptive core infrastructure that MUST be complete before ANY user story can be implemented with adaptation capabilities and evolution readiness

**⚠️ CRITICAL**: No user story work can begin until this phase is complete

Examples of adaptive foundational tasks (adjust based on your project):

- [ ] T008 [EVOLVE] Setup adaptive database schema with automatic evolution capabilities and migration framework
- [ ] T009 [P] [ADAPT] Implement adaptive authentication/authorization framework with role evolution support
- [ ] T010 [P] [ADAPT] Setup adaptive API routing and context-aware middleware with version evolution support
- [ ] T011 [ADAPT] Create adaptive base models/entities that can evolve with schema migration strategies
- [ ] T012 [ADAPT] Configure adaptive error handling and context-aware logging with evolution monitoring
- [ ] T013 [ADAPT] Setup adaptive environment configuration with context switching and evolution flags
- [ ] T014 [ADAPT] Initialize adaptation engine and feedback processing with learning algorithm evolution
- [ ] T015 [ADAPT] Implement reasoning chain framework for decision traceability with evolution insights
- [ ] T016 [EVOLVE] Implement backward compatibility framework for smooth evolution transitions
- [ ] T017 [ADAPT] Setup context-aware monitoring and observability with adaptation metrics

**Adaptive Checkpoint**: Foundation ready - adaptive user story implementation can now begin with evolution planning

---

## Phase 3: User Story 1 - [Title] (Priority: P1) 🎯 Adaptive MVP with Evolution

**Goal**: [Brief description of what this story delivers with adaptive capabilities and evolution planning]

**Independent Test**: [How to verify this story works on its own across different contexts]

**Evolution Test**: [How to verify this story can evolve to handle changing requirements]

### Adaptive Tests for User Story 1 (OPTIONAL - only if tests requested) ⚠️

> **NOTE: Write these adaptive tests FIRST, ensure they FAIL before implementation**

- [ ] T018 [P] [US1] [ADAPT] Adaptive contract test for [endpoint] in tests/contract/test_[name].py
- [ ] T019 [P] [US1] [ADAPT] Adaptive integration test for [user journey] in tests/integration/test_[name].py
- [ ] T020 [P] [US1] [CONTEXT] Context-aware test for [behavior in context A] in tests/context/test_[name].py
- [ ] T021 [US1] [ADAPT] Adaptation effectiveness test for [adaptive behavior] in tests/adaptation/test_[name].py
- [ ] T022 [US1] [EVOLVE] Evolution scenario test for [how this adapts to requirement changes] in tests/evolution/test_[name].py
- [ ] T023 [US1] [EVOLVE] Schema migration test for [entity evolution] in tests/evolution/test_[name].py

### Adaptive Implementation for User Story 1

- [ ] T024 [P] [US1] [ADAPT] Create adaptive [Entity1] model with evolution strategies in src/models/[entity1].py
- [ ] T025 [P] [US1] [ADAPT] Create adaptive [Entity2] model with evolution strategies in src/models/[entity2].py
- [ ] T026 [US1] [ADAPT] Implement adaptive [Service] with evolution monitoring in src/services/[service].py (depends on T024, T025)
- [ ] T027 [US1] [ADAPT] Implement adaptive [endpoint/feature] with context awareness in src/[location]/[file].py
- [ ] T028 [US1] [CONTEXT] Add context detection and switching for User Story 1
- [ ] T029 [US1] [ADAPT] Add adaptive validation and context-aware error handling
- [ ] T030 [US1] [ADAPT] Add adaptive logging for reasoning chain traceability
- [ ] T031 [US1] [EVOLVE] Add schema evolution plan for User Story 1 entities in `/evolution/schemas/[name].json`
- [ ] T032 [US1] [EVOLVE] Add backward compatibility layers for future changes
- [ ] T033 [US1] [FEEDBACK] Add feedback collection for User Story 1 adaptation learning

**Adaptive Checkpoint**: At this point, User Story 1 should be fully functional and testable independently across contexts and evolution scenarios

---

## Phase 4: User Story 2 - [Title] (Priority: P2) with Evolution Planning

**Goal**: [Brief description of what this story delivers with adaptive capabilities and evolution planning]

**Independent Test**: [How to verify this story works on its own across different contexts]

**Evolution Test**: [How to verify this story can evolve to handle changing requirements]

### Adaptive Tests for User Story 2 (OPTIONAL - only if tests requested) ⚠️

- [ ] T034 [P] [US2] [ADAPT] Adaptive contract test for [endpoint] in tests/contract/test_[name].py
- [ ] T035 [P] [US2] [CONTEXT] Context-aware test for [behavior] in tests/context/test_[name].py
- [ ] T036 [US2] [EVOLVE] Evolution integration test for [how User Story 2 adapts when User Story 1 evolves] in tests/evolution/test_[name].py

### Adaptive Implementation for User Story 2

- [ ] T037 [P] [US2] [ADAPT] Create adaptive [Entity] model with evolution strategies in src/models/[entity].py
- [ ] T038 [US2] [ADAPT] Implement adaptive [Service] with evolution monitoring in src/services/[service].py
- [ ] T039 [US2] [ADAPT] Implement adaptive [endpoint/feature] with context awareness in src/[location]/[file].py
- [ ] T040 [US2] [ADAPT] Integrate with User Story 1 adaptive components (if needed) with backward compatibility
- [ ] T041 [US2] [EVOLVE] Add evolution pathway for User Story 2 components with migration plan
- [ ] T042 [US2] [EVOLVE] Add cross-story evolution integration points with change propagation handling
- [ ] T043 [US2] [FEEDBACK] Add feedback collection for User Story 2 adaptation learning

**Adaptive Checkpoint**: At this point, User Stories 1 AND 2 should both work independently across contexts and handle evolution independently

---

## Phase 5: User Story 3 - [Title] (Priority: P3) with Advanced Evolution

**Goal**: [Brief description of what this story delivers with adaptive capabilities and advanced evolution planning]

**Independent Test**: [How to verify this story works on its own across different contexts]

**Evolution Test**: [How to verify this story can evolve to handle changing requirements]

### Adaptive Tests for User Story 3 (OPTIONAL - only if tests requested) ⚠️

- [ ] T044 [P] [US3] [ADAPT] Adaptive contract test for [endpoint] in tests/contract/test_[name].py
- [ ] T045 [US3] [ADAPT] Adaptation learning test for [behavior evolution] in tests/adaptation/test_[name].py
- [ ] T046 [US3] [EVOLVE] Complex evolution scenario test involving multiple story interactions in tests/evolution/test_[name].py

### Adaptive Implementation for User Story 3

- [ ] T047 [P] [US3] [ADAPT] Create adaptive [Entity] model with advanced evolution strategies in src/models/[entity].py
- [ ] T048 [US3] [ADAPT] Implement adaptive [Service] with advanced evolution monitoring in src/services/[service].py
- [ ] T049 [US3] [ADAPT] Implement adaptive [endpoint/feature] with context awareness in src/[location]/[file].py
- [ ] T050 [US3] [EVOLVE] Add advanced schema evolution plan with complex migration scenarios
- [ ] T051 [US3] [EVOLVE] Integrate with evolution framework for cross-story change propagation
- [ ] T052 [US3] [FEEDBACK] Add advanced feedback collection for User Story 3 adaptation learning

**Adaptive Checkpoint**: All user stories should now be independently functional across contexts and handle evolution scenarios

---

[Add more adaptive user story phases as needed, following the same pattern with adaptation and evolution considerations]

---

## Phase N: Adaptive Polish & Cross-Cutting Evolution Concerns

**Purpose**: Adaptive improvements that affect multiple user stories, enhance adaptation effectiveness, and ensure evolution readiness

- [ ] TXXX [P] [ADAPT] Adaptive documentation updates in docs/ with evolution guides
- [ ] TXXX [ADAPT] Adaptive code cleanup and refactoring for evolution with migration strategies
- [ ] TXXX [ADAPT] Adaptive performance optimization across contexts with evolution impact analysis
- [ ] TXXX [P] [ADAPT] Additional adaptive unit tests (if requested) in tests/unit/ with evolution scenarios
- [ ] TXXX [ADAPT] Adaptive security hardening across contexts with evolution consideration
- [ ] TXXX [ADAPT] [P] Adaptive reasoning chain validation in adaptation/ with evolution insights
- [ ] TXXX [ADAPT] Run quickstart.md validation across different contexts and evolution scenarios
- [ ] TXXX [EVOLVE] Final evolution pathway validation and integration testing
- [ ] TXXX [EVOLVE] Backward compatibility verification across all evolved components
- [ ] TXXX [EVOLVE] Schema migration rehearsal and validation
- [ ] TXXX [EVOLVE] Create evolution runbook and change management procedures

---

## Dependencies & Adaptive Execution Order with Evolution

### Phase Dependencies

- **Adaptive Setup (Phase 1)**: No dependencies - can start immediately
- **Adaptive Foundation (Phase 2)**: Depends on Setup completion - BLOCKS all user stories and evolution framework
- **Adaptive User Stories (Phase 3+)**: All depend on Adaptive Foundation phase completion
  - User stories can then proceed in parallel (if staffed)
  - Or sequentially in priority order (P1 → P2 → P3)
  - With adaptive and evolution considerations for context overlap
- **Adaptive Polish (Final Phase)**: Depends on all desired user stories being complete with evolution validation

### User Story Dependencies with Evolution

- **User Story 1 (P1)**: Can start after Adaptive Foundation (Phase 2) - No dependencies on other stories but sets evolution patterns for others
- **User Story 2 (P2)**: Can start after Adaptive Foundation (Phase 2) - May integrate with US1 but should be independently testable and evolvable
- **User Story 3 (P3)**: Can start after Adaptive Foundation (Phase 2) - May integrate with US1/US2 but should be independently testable and evolvable

### Within Each Adaptive User Story

- Adaptive tests (if included) MUST be written and FAIL before implementation
- Adaptive models before adaptive services
- Adaptive services before adaptive endpoints
- Core adaptive implementation before adaptive integration
- Evolution planning alongside core implementation
- Backward compatibility layers with evolving components
- Adaptive story complete before moving to next priority

### Parallel Opportunities with Evolution

- All Setup tasks marked [P] can run in parallel
- All Adaptive Foundation tasks marked [P] can run in parallel (within Phase 2)
- Once Adaptive Foundation phase completes, all user stories can start in parallel (if team capacity allows)
- All adaptive tests for a user story marked [P] can run in parallel
- Adaptive models within a story marked [P] can run in parallel
- Different adaptive user stories can be worked on in parallel by different team members
- Context-aware components can be developed in parallel with core functionality
- Evolution planning can run parallel to implementation for each user story

---

## Adaptive Parallel Example: User Story 1

```bash
# Launch all adaptive tests for User Story 1 together (if tests requested):
Task: "Adaptive contract test for [endpoint] in tests/contract/test_[name].py"
Task: "Context-aware test for [behavior] in tests/context/test_[name].py"
Task: "Evolution scenario test for [requirement change] in tests/evolution/test_[name].py"

# Launch all adaptive models for User Story 1 together:
Task: "Create adaptive [Entity1] model with evolution strategies in src/models/[entity1].py"
Task: "Create adaptive [Entity2] model with evolution strategies in src/models/[entity2].py"

# Launch implementation and evolution planning in parallel:
Task: "Implement adaptive [Service] with evolution monitoring in src/services/[service].py"
Task: "Add schema evolution plan for User Story 1 entities in /evolution/schemas/[name].json"
```

---

## Adaptive Implementation Strategy with Evolution

### Adaptive MVP First (User Story 1 Only)

1. Complete Adaptive Phase 1: Setup with evolution planning
2. Complete Adaptive Phase 2: Foundation with evolution framework (CRITICAL - blocks all stories)
3. Complete Adaptive Phase 3: User Story 1 with evolution validation
4. **STOP and VALIDATE**: Test User Story 1 independently across contexts and evolution scenarios
5. Deploy/demo if ready

### Adaptive Incremental Delivery with Evolution

1. Complete Adaptive Setup + Foundation → Adaptive foundation ready with evolution framework
2. Add Adaptive User Story 1 → Test independently across contexts and evolution scenarios → Deploy/Demo (Adaptive MVP!)
3. Add Adaptive User Story 2 → Test independently across contexts and evolution scenarios → Deploy/Demo
4. Add Adaptive User Story 3 → Test independently across contexts and evolution scenarios → Deploy/Demo
5. Each adaptive story adds value without breaking previous stories and can evolve independently

### Adaptive Parallel Team Strategy with Evolution

With multiple developers:

1. Team completes Adaptive Setup + Foundation together with evolution framework
2. Once Adaptive Foundation is done:
   - Developer A: Adaptive User Story 1 with evolution planning
   - Developer B: Adaptive User Story 2 with evolution planning  
   - Developer C: Adaptive User Story 3 with evolution planning
3. Adaptive stories complete and integrate independently while learning from each other and planning for evolution

---

## Adaptive Reasoning Chain Integration with Evolution

### Decision Traceability

- Each adaptive task should have reasoning chain links with evolution impact analysis
- Track why adaptation mechanisms were chosen and how they support evolution
- Connect implementation decisions to specification requirements and evolution scenarios
- Document context-aware decision logic and evolution pathways

### Learning Integration

- Each completed task contributes to adaptation knowledge and evolution insights
- Reasoning chains inform future adaptation and evolution decisions
- Context switching decisions are logged for learning and evolution patterns
- Success/failure of adaptive components is tracked with evolution impact
- Evolution scenarios and their outcomes are documented for future reference

---

## Evolution Management Tracking

### Schema Evolution Tasks

- Each model change must have corresponding migration scripts
- Schema versioning and backward compatibility verification
- Migration testing across different environments

### API Evolution Tasks

- Version management and backward compatibility
- Change propagation and cross-service evolution
- Client adaptation to API changes

### Dependency Evolution Tasks

- Version updates with evolution impact analysis
- Breaking change detection and mitigation
- Migration path documentation

---

## Notes

- [P] tasks = different files, no dependencies
- [Story] label maps task to specific user story for traceability
- [Adapt] label indicates tasks involving adaptation logic
- [Evolve] label indicates tasks involving evolution planning or schema changes
- Each adaptive user story should be independently completable and testable across contexts and evolution scenarios
- Verify adaptive tests fail before implementing
- Commit after each task or logical group
- Stop at any checkpoint to validate story independently across contexts and evolution paths
- Avoid: vague tasks, same file conflicts, cross-story dependencies that break independence, evolution conflicts
- Emphasize: reasoning chains, adaptation effectiveness, context awareness, learning capabilities, and evolution readiness
- Plan: evolution scenarios, migration paths, backward compatibility, change propagation
