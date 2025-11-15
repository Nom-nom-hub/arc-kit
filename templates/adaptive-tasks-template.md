---

description: "Adaptive task list template for feature implementation with reasoning chains"
---

# Adaptive Tasks: [FEATURE NAME]

**Input**: Adaptive design documents from `/specs/[###-feature-name]/`
**Prerequisites**: plan.md (required), spec.md (required for user stories), research.md, data-model.md, contracts/

**Adaptive Tests**: The examples below include adaptive test tasks. Tests are OPTIONAL - only include them if explicitly requested in the adaptive feature specification. Adaptive tests should verify behavior across different contexts and adaptation effectiveness.

**Organization**: Tasks are grouped by user story to enable independent implementation and testing of each story, with adaptive reasoning chains connecting decisions to outcomes.

## Format: `[ID] [P?] [Story] [Adapt] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (e.g., US1, US2, US3)  
- **[Adapt]**: Task involves adaptation logic (e.g., [ADAPT], [CONTEXT], [EVOLVE])
- Include exact file paths in descriptions

## Adaptive Path Conventions

- **Adaptive Single project**: `src/`, `tests/`, `adaptation/` at repository root
- **Adaptive Web app**: `backend/src/`, `frontend/src/`, `adaptation/`
- **Adaptive Mobile**: `api/src/`, `ios/src/` or `android/src/`, `adaptation/`
- Paths shown below assume adaptive single project - adjust based on plan.md structure

<!--
  ============================================================================
  IMPORTANT: The adaptive tasks below are SAMPLE TASKS for illustration only.

  The /arckit.chain command MUST replace these with actual adaptive tasks based on:
  - Adaptive user stories from spec.md (with their priorities P1, P2, P3...)
  - Adaptive feature requirements from plan.md  
  - Adaptive entities from data-model.md
  - Adaptive endpoints from contracts/
  - Reasoning chains that connect decisions to outcomes

  Tasks MUST be organized by user story so each story can be:
  - Implemented independently
  - Tested independently across contexts
  - Delivered as an adaptive MVP increment
  - Adapted to changing requirements independently

  DO NOT keep these sample tasks in the generated tasks.md file.
  ============================================================================
-->

## Phase 1: Adaptive Setup (Shared Infrastructure)

**Purpose**: Adaptive project initialization and basic structure with reasoning chain foundation

- [ ] T001 [ADAPT] Create adaptive project structure per implementation plan
- [ ] T002 [ADAPT] Initialize [language] project with [adaptive framework] dependencies
- [ ] T003 [P] [ADAPT] Configure adaptive linting and formatting tools
- [ ] T004 [ADAPT] Setup reasoning chain logging and traceability infrastructure
- [ ] T005 [ADAPT] Initialize context detection and management framework

---

## Phase 2: Adaptive Foundation (Blocking Prerequisites)

**Purpose**: Adaptive core infrastructure that MUST be complete before ANY user story can be implemented with adaptation capabilities

**⚠️ CRITICAL**: No user story work can begin until this phase is complete

Examples of adaptive foundational tasks (adjust based on your project):

- [ ] T006 [ADAPT] Setup adaptive database schema with evolution capabilities
- [ ] T007 [P] [ADAPT] Implement adaptive authentication/authorization framework
- [ ] T008 [P] [ADAPT] Setup adaptive API routing and context-aware middleware structure
- [ ] T009 [ADAPT] Create adaptive base models/entities that can evolve
- [ ] T010 [ADAPT] Configure adaptive error handling and context-aware logging infrastructure
- [ ] T011 [ADAPT] Setup adaptive environment configuration with context switching
- [ ] T012 [ADAPT] Initialize adaptation engine and feedback processing infrastructure
- [ ] T013 [ADAPT] Implement reasoning chain framework for decision traceability

**Adaptive Checkpoint**: Foundation ready - adaptive user story implementation can now begin in parallel

---

## Phase 3: User Story 1 - [Title] (Priority: P1) 🎯 Adaptive MVP

**Goal**: [Brief description of what this story delivers with adaptive capabilities]

**Independent Test**: [How to verify this story works on its own across different contexts]

### Adaptive Tests for User Story 1 (OPTIONAL - only if tests requested) ⚠️

> **NOTE: Write these adaptive tests FIRST, ensure they FAIL before implementation**

- [ ] T014 [P] [US1] [ADAPT] Adaptive contract test for [endpoint] in tests/contract/test_[name].py
- [ ] T015 [P] [US1] [ADAPT] Adaptive integration test for [user journey] in tests/integration/test_[name].py
- [ ] T016 [P] [US1] [CONTEXT] Context-aware test for [behavior in context A] in tests/context/test_[name].py
- [ ] T017 [US1] [ADAPT] Adaptation effectiveness test for [adaptive behavior] in tests/adaptation/test_[name].py

### Adaptive Implementation for User Story 1

- [ ] T018 [P] [US1] [ADAPT] Create adaptive [Entity1] model in src/models/[entity1].py
- [ ] T019 [P] [US1] [ADAPT] Create adaptive [Entity2] model in src/models/[entity2].py
- [ ] T020 [US1] [ADAPT] Implement adaptive [Service] in src/services/[service].py (depends on T018, T019)
- [ ] T021 [US1] [ADAPT] Implement adaptive [endpoint/feature] with context awareness in src/[location]/[file].py
- [ ] T022 [US1] [CONTEXT] Add context detection and switching for User Story 1
- [ ] T023 [US1] [ADAPT] Add adaptive validation and context-aware error handling
- [ ] T024 [US1] [ADAPT] Add adaptive logging for reasoning chain traceability

**Adaptive Checkpoint**: At this point, User Story 1 should be fully functional and testable independently across contexts

---

## Phase 4: User Story 2 - [Title] (Priority: P2)

**Goal**: [Brief description of what this story delivers with adaptive capabilities]

**Independent Test**: [How to verify this story works on its own across different contexts]

### Adaptive Tests for User Story 2 (OPTIONAL - only if tests requested) ⚠️

- [ ] T025 [P] [US2] [ADAPT] Adaptive contract test for [endpoint] in tests/contract/test_[name].py
- [ ] T026 [P] [US2] [CONTEXT] Context-aware test for [behavior] in tests/context/test_[name].py

### Adaptive Implementation for User Story 2

- [ ] T027 [P] [US2] [ADAPT] Create adaptive [Entity] model in src/models/[entity].py
- [ ] T028 [US2] [ADAPT] Implement adaptive [Service] in src/services/[service].py
- [ ] T029 [US2] [ADAPT] Implement adaptive [endpoint/feature] with context awareness in src/[location]/[file].py
- [ ] T030 [US2] [ADAPT] Integrate with User Story 1 adaptive components (if needed)
- [ ] T031 [US2] [EVOLVE] Add evolution pathway for User Story 2 components

**Adaptive Checkpoint**: At this point, User Stories 1 AND 2 should both work independently across contexts

---

## Phase 5: User Story 3 - [Title] (Priority: P3)

**Goal**: [Brief description of what this story delivers with adaptive capabilities]

**Independent Test**: [How to verify this story works on its own across different contexts]

### Adaptive Tests for User Story 3 (OPTIONAL - only if tests requested) ⚠️

- [ ] T032 [P] [US3] [ADAPT] Adaptive contract test for [endpoint] in tests/contract/test_[name].py
- [ ] T033 [US3] [ADAPT] Adaptation learning test for [behavior evolution] in tests/adaptation/test_[name].py

### Adaptive Implementation for User Story 3

- [ ] T034 [P] [US3] [ADAPT] Create adaptive [Entity] model in src/models/[entity].py
- [ ] T035 [US3] [ADAPT] Implement adaptive [Service] in src/services/[service].py
- [ ] T036 [US3] [ADAPT] Implement adaptive [endpoint/feature] with context awareness in src/[location]/[file].py
- [ ] T037 [US3] [ADAPT] Add feedback collection for User Story 3 adaptation

**Adaptive Checkpoint**: All user stories should now be independently functional across contexts

---

[Add more adaptive user story phases as needed, following the same pattern with adaptation considerations]

---

## Phase N: Adaptive Polish & Cross-Cutting Concerns

**Purpose**: Adaptive improvements that affect multiple user stories and enhance adaptation effectiveness

- [ ] TXXX [P] [ADAPT] Adaptive documentation updates in docs/
- [ ] TXXX [ADAPT] Adaptive code cleanup and refactoring for evolution
- [ ] TXXX [ADAPT] Adaptive performance optimization across contexts
- [ ] TXXX [P] [ADAPT] Additional adaptive unit tests (if requested) in tests/unit/
- [ ] TXXX [ADAPT] Adaptive security hardening across contexts
- [ ] TXXX [ADAPT] [P] Adaptive reasoning chain validation in adaptation/
- [ ] TXXX [ADAPT] Run quickstart.md validation across different contexts

---

## Dependencies & Adaptive Execution Order

### Phase Dependencies

- **Adaptive Setup (Phase 1)**: No dependencies - can start immediately
- **Adaptive Foundation (Phase 2)**: Depends on Setup completion - BLOCKS all user stories
- **Adaptive User Stories (Phase 3+)**: All depend on Adaptive Foundation phase completion
  - User stories can then proceed in parallel (if staffed)
  - Or sequentially in priority order (P1 → P2 → P3)
  - With adaptive considerations for context overlap
- **Adaptive Polish (Final Phase)**: Depends on all desired user stories being complete

### User Story Dependencies

- **User Story 1 (P1)**: Can start after Adaptive Foundation (Phase 2) - No dependencies on other stories
- **User Story 2 (P2)**: Can start after Adaptive Foundation (Phase 2) - May integrate with US1 but should be independently testable
- **User Story 3 (P3)**: Can start after Adaptive Foundation (Phase 2) - May integrate with US1/US2 but should be independently testable

### Within Each Adaptive User Story

- Adaptive tests (if included) MUST be written and FAIL before implementation
- Adaptive models before adaptive services
- Adaptive services before adaptive endpoints
- Core adaptive implementation before adaptive integration
- Adaptive story complete before moving to next priority

### Parallel Opportunities

- All Setup tasks marked [P] can run in parallel
- All Adaptive Foundation tasks marked [P] can run in parallel (within Phase 2)
- Once Adaptive Foundation phase completes, all user stories can start in parallel (if team capacity allows)
- All adaptive tests for a user story marked [P] can run in parallel
- Adaptive models within a story marked [P] can run in parallel
- Different adaptive user stories can be worked on in parallel by different team members
- Context-aware components can be developed in parallel with core functionality

---

## Adaptive Parallel Example: User Story 1

```bash
# Launch all adaptive tests for User Story 1 together (if tests requested):
Task: "Adaptive contract test for [endpoint] in tests/contract/test_[name].py"
Task: "Context-aware test for [behavior] in tests/context/test_[name].py"

# Launch all adaptive models for User Story 1 together:
Task: "Create adaptive [Entity1] model in src/models/[entity1].py"
Task: "Create adaptive [Entity2] model in src/models/[entity2].py"
```

---

## Adaptive Implementation Strategy

### Adaptive MVP First (User Story 1 Only)

1. Complete Adaptive Phase 1: Setup
2. Complete Adaptive Phase 2: Foundation (CRITICAL - blocks all stories)
3. Complete Adaptive Phase 3: User Story 1
4. **STOP and VALIDATE**: Test User Story 1 independently across contexts
5. Deploy/demo if ready

### Adaptive Incremental Delivery

1. Complete Adaptive Setup + Foundation → Adaptive foundation ready
2. Add Adaptive User Story 1 → Test independently across contexts → Deploy/Demo (Adaptive MVP!)
3. Add Adaptive User Story 2 → Test independently across contexts → Deploy/Demo  
4. Add Adaptive User Story 3 → Test independently across contexts → Deploy/Demo
5. Each adaptive story adds value without breaking previous stories

### Adaptive Parallel Team Strategy

With multiple developers:

1. Team completes Adaptive Setup + Foundation together
2. Once Adaptive Foundation is done:
   - Developer A: Adaptive User Story 1
   - Developer B: Adaptive User Story 2  
   - Developer C: Adaptive User Story 3
3. Adaptive stories complete and integrate independently while learning from each other

---

## Adaptive Reasoning Chain Integration

### Decision Traceability

- Each adaptive task should have reasoning chain links
- Track why adaptation mechanisms were chosen
- Connect implementation decisions to specification requirements
- Document context-aware decision logic

### Learning Integration

- Each completed task contributes to adaptation knowledge
- Reasoning chains inform future adaptation decisions
- Context switching decisions are logged for learning
- Success/failure of adaptive components is tracked

---

## Notes

- [P] tasks = different files, no dependencies
- [Story] label maps task to specific user story for traceability
- [Adapt] label indicates tasks involving adaptation logic
- Each adaptive user story should be independently completable and testable across contexts
- Verify adaptive tests fail before implementing
- Commit after each task or logical group
- Stop at any checkpoint to validate story independently
- Avoid: vague tasks, same file conflicts, cross-story dependencies that break independence
- Emphasize: reasoning chains, adaptation effectiveness, context awareness, learning capabilities
