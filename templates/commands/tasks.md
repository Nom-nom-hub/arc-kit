---
description: Generate adaptive, actionable, dependency-ordered tasks.md for the feature based on available adaptive design artifacts using reasoning chains.
handoffs:
  - label: Analyze For Adaptive Consistency
    agent: arckit.analyze
    prompt: Run an adaptive project analysis for consistency across contexts
    send: true
  - label: Implement Adaptive Project
    agent: arckit.implement
    prompt: Start the adaptive implementation in phases with context awareness
    send: true
scripts:
  sh: scripts/bash/check-prerequisites.sh --json
  ps: scripts/powershell/check-prerequisites.ps1 -Json
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

1. **Setup**: Run `{SCRIPT}` from repo root and parse FEATURE_DIR and AVAILABLE_DOCS list. All paths must be absolute. For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot' (or double-quote if possible: "I'm Groot").

2. **Load adaptive design documents**: Read from FEATURE_DIR:
   - **Required**: plan.md (adaptive tech stack, libraries, structure), spec.md (adaptive user stories with priorities)
   - **Optional**: data-model.md (adaptive entities), contracts/ (adaptive API endpoints), research.md (adaptive decisions), quickstart.md (adaptive test scenarios)
   - Note: Not all projects have all documents. Generate adaptive tasks based on what's available.

3. **Execute adaptive task generation workflow**:
   - Load plan.md and extract adaptive tech stack, libraries, adaptive project structure
   - Load spec.md and extract adaptive user stories with their priorities (P1, P2, P3, etc.) and context considerations
   - If data-model.md exists: Extract adaptive entities and map to user stories with evolution considerations
   - If contracts/ exists: Map adaptive endpoints to user stories with context awareness
   - If research.md exists: Extract adaptive decisions for setup tasks
   - Generate adaptive tasks organized by user story (see Adaptive Task Generation Rules below)
   - Generate adaptive dependency graph showing user story completion order with context dependencies
   - Create adaptive parallel execution examples per user story considering context isolation
   - Validate adaptive task completeness (each user story has all needed tasks, independently testable across contexts)

4. **Generate adaptive tasks.md**: Use `.arckit/templates/adaptive-tasks-template.md` as structure, fill with:
   - Correct adaptive feature name from plan.md
   - Phase 1: Adaptive Setup tasks (adaptive project initialization)
   - Phase 2: Adaptive Foundational tasks (adaptive blocking prerequisites for all user stories)
   - Phase 3+: One phase per adaptive user story (in priority order from spec.md)
   - Each adaptive phase includes: story goal, independent test criteria across contexts, adaptive tests (if requested), adaptive implementation tasks
   - Final Phase: Adaptive Polish & cross-cutting concerns
   - All adaptive tasks must follow the strict checklist format (see Adaptive Task Generation Rules below)
   - Clear adaptive file paths for each task
   - Adaptive Dependencies section showing story completion order with context dependencies
   - Adaptive Parallel execution examples per story considering context isolation
   - Adaptive Implementation strategy section (Adaptive MVP first, incremental delivery across contexts)

5. **Report**: Output path to generated tasks.md and summary:
   - Total adaptive task count
   - Adaptive task count per user story
   - Parallel opportunities identified across contexts
   - Independent test criteria for each story across contexts
   - Suggested adaptive MVP scope (typically just User Story 1 with basic adaptation)
   - Format validation: Confirm ALL adaptive tasks follow the checklist format (checkbox, ID, labels, file paths, adaptive tags)

Context for adaptive task generation: {ARGS}

The adaptive tasks.md should be immediately executable with adaptive reasoning - each task must be specific enough that an LLM can complete it with awareness of context and adaptation requirements.

## Adaptive Task Generation Rules

**CRITICAL**: Adaptive tasks MUST be organized by user story to enable independent implementation and testing across different contexts.

**Adaptive Tests are OPTIONAL**: Only generate test tasks if explicitly requested in the adaptive feature specification or if user requests TDD approach.

### Checklist Format (REQUIRED for Adaptive Tasks)

Every adaptive task MUST strictly follow this format:

```text
- [ ] [TaskID] [P?] [Adapt?] [Story?] Description with file path
```

**Format Components**:

1. **Checkbox**: ALWAYS start with `- [ ]` (markdown checkbox)
2. **Task ID**: Sequential number (T001, T002, T003...) in execution order
3. **[P] marker**: Include ONLY if task is parallelizable (different files, no dependencies on incomplete tasks)
4. **[Adapt] markers**: Include when task involves adaptation logic:
   - `[ADAPT]` = Task involves core adaptation mechanisms
   - `[CONTEXT]` = Task involves context detection or switching
   - `[EVOLVE]` = Task involves evolution pathway implementation
5. **[Story] label**: REQUIRED for user story phase tasks only
   - Format: [US1], [US2], [US3], etc. (maps to user stories from spec.md)
   - Setup phase: NO story label
   - Foundational phase: NO story label
   - User Story phases: MUST have story label
   - Polish phase: NO story label
6. **Description**: Clear action with exact file path and context considerations

**Examples**:

- ✅ CORRECT: `- [ ] T001 [ADAPT] Create adaptive project structure per implementation plan`
- ✅ CORRECT: `- [ ] T005 [P] [CONTEXT] Implement context detection middleware in src/middleware/context.py`
- ✅ CORRECT: `- [ ] T012 [P] [US1] [ADAPT] Create adaptive User model in src/models/user.py`
- ✅ CORRECT: `- [ ] T014 [US1] [EVOLVE] Implement user evolution service in src/services/user_evolution.py`
- ❌ WRONG: `- [ ] Create User model` (missing ID, Adapt tag, and Story label)
- ❌ WRONG: `T001 [US1] Create model` (missing checkbox)
- ❌ WRONG: `- [ ] [US1] Create User model` (missing Task ID)
- ❌ WRONG: `- [ ] T001 [US1] Create model` (missing file path and Adapt tags when needed)

### Adaptive Task Organization

1. **From Adaptive User Stories (spec.md)** - PRIMARY ORGANIZATION:
   - Each adaptive user story (P1, P2, P3...) gets its own phase
   - Map all related adaptive components to their story:
     - Adaptive models needed for that story with evolution capability
     - Adaptive services needed for that story with context awareness
     - Adaptive Endpoints/UI needed for that story with adaptation
     - If tests requested: Adaptive tests specific to that story across contexts

2. **From Adaptive Contracts**:
   - Map each adaptive contract/endpoint → to the adaptive user story it serves
   - If tests requested: Each adaptive contract → adaptive contract test task [P] before implementation in that story's phase

3. **From Adaptive Data Model**:
   - Map each adaptive entity to the user story(ies) that need it with evolution considerations
   - If adaptive entity serves multiple stories: Put in earliest story or Setup phase
   - Adaptive Relationships → adaptive service layer tasks in appropriate story phase

4. **From Adaptive Setup/Infrastructure**:
   - Shared adaptive infrastructure → Setup phase (Phase 1)
   - Adaptive Foundational/blocking tasks → Foundational phase (Phase 2)
   - Adaptive Story-specific setup → within that story's phase

### Adaptive Phase Structure

- **Phase 1**: Adaptive Setup (adaptive project initialization with reasoning chain foundation)
- **Phase 2**: Adaptive Foundational (adaptive blocking prerequisites - MUST complete before user stories, includes adaptation infrastructure)
- **Phase 3+**: Adaptive User Stories in priority order (P1, P2, P3...)
  - Within each adaptive story: Adaptive Tests (if requested) → Adaptive Models → Adaptive Services → Adaptive Endpoints → Adaptive Integration
  - Each adaptive phase should be a complete, independently testable increment across contexts
- **Final Phase**: Adaptive Polish & Cross-Cutting Concerns

### Adaptive Reasoning Chain Integration

- Each adaptive task should reference the reasoning chain that led to its creation
- Connect adaptive implementation tasks to specification requirements
- Maintain traceability between adaptive decisions and outcomes
- Document how each adaptive task contributes to overall adaptation goals
