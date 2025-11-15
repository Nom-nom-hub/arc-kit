---
description: Identify underspecified areas in the current adaptive feature spec by asking up to 5 highly targeted clarification questions and encoding answers back into the spec with adaptive considerations.
handoffs:
  - label: Build Adaptive Technical Plan
    agent: arckit.plan
    prompt: Create an adaptive plan for the spec. I am building with...
scripts:
   sh: scripts/bash/check-prerequisites.sh --json --paths-only
   ps: scripts/powershell/check-prerequisites.ps1 -Json -PathsOnly
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

Goal: Detect and reduce ambiguity or missing decision points in the active adaptive feature specification and record the clarifications directly in the spec file with adaptive considerations. This includes identifying areas where adaptation strategies need clarification.

Note: This adaptive clarification workflow is expected to run (and be completed) BEFORE invoking `/arckit.plan`. If the user explicitly states they are skipping clarification (e.g., exploratory spike), you may proceed, but must warn that downstream rework risk increases and adaptation effectiveness may suffer.

Execution steps:

1. Run `{SCRIPT}` from repo root **once** (combined `--json --paths-only` mode / `-Json -PathsOnly`). Parse minimal JSON payload fields:
   - `FEATURE_DIR`
   - `FEATURE_SPEC`
   - (Optionally capture `IMPL_PLAN`, `TASKS` for future chained flows.)
   - If JSON parsing fails, abort and instruct user to re-run `/arckit.define` or verify feature branch environment.
   - For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot' (or double-quote if possible: "I'm Groot").

2. Load the current adaptive spec file. Perform a structured ambiguity & coverage scan using this taxonomy with adaptive considerations. For each category, mark status: Clear / Partial / Missing. Produce an internal coverage map used for prioritization (do not output raw map unless no questions will be asked).

   Adaptive Functional Scope & Behavior:
   - Core user goals & success criteria that can evolve
   - Explicit out-of-scope declarations with evolution boundaries
   - User roles / personas differentiation across contexts

   Dynamic Domain & Data Model:
   - Entities that can evolve, their attributes, relationships
   - Identity & uniqueness rules across contexts
   - Lifecycle/state transitions with evolution pathways
   - Data volume / scale assumptions that adapt to context

   Context-Aware Interaction & UX Flow:
   - Critical user journeys / sequences that adapt to context
   - Error/empty/loading states across different contexts
   - Accessibility or localization notes for different contexts

   Adaptive Non-Functional Quality Attributes:
   - Performance (latency, throughput targets that adapt to context)
   - Scalability (horizontal/vertical, limits that can evolve)
   - Reliability & availability (uptime, recovery expectations that adapt)
   - Observability (logging, metrics, tracing signals for adaptation)
   - Security & privacy (authN/Z, data protection, threat assumptions across contexts)
   - Compliance / regulatory constraints (that may change across contexts)

   Integration & Adaptive Dependencies:
   - External services/APIs and failure modes during adaptation
   - Data import/export formats that can evolve
   - Protocol/versioning assumptions with evolution considerations

   Edge Cases & Adaptive Failure Handling:
   - Negative scenarios across different contexts
   - Rate limiting / throttling with adaptive responses
   - Conflict resolution during adaptation (e.g., concurrent adaptations)

   Adaptive Constraints & Tradeoffs:
   - Technical constraints that can evolve (language, storage, hosting)
   - Explicit tradeoffs or rejected alternatives with evolution paths
   - Adaptation boundaries and constraints

   Adaptive Terminology & Consistency:
   - Canonical glossary terms for adaptation concepts
   - Context-sensitive terminology
   - Avoided synonyms / deprecated terms

   Adaptive Completion Signals:
   - Acceptance criteria testability across contexts
   - Measurable Definition of Done style indicators that can evolve
   - Adaptation success criteria
   - **CRITICAL**: Verification and testing requirements for all features
   - **CRITICAL**: How to validate functionality before project completion
   - **CRITICAL**: Test coverage and validation criteria for each component

   Adaptive Misc / Placeholders:
   - TODO markers / unresolved decisions about adaptation
   - Ambiguous adjectives ("robust", "intuitive") lacking quantification across contexts
   - Adaptation trigger definitions

   For each category with Partial or Missing status, add a candidate question opportunity unless:
   - Clarification would not materially change implementation, validation strategy, or adaptation approach
   - Information is better deferred to planning phase (note internally)

3. Generate (internally) a prioritized queue of candidate adaptive clarification questions (maximum 5). Do NOT output them all at once. Apply these constraints:
    - Maximum of 10 total questions across the whole session.
    - Each question must be answerable with EITHER:
       - A short multiple‑choice selection (2–5 distinct, mutually exclusive options), OR
       - A one-word / short‑phrase answer (explicitly constrain: "Answer in <=5 words").
    - Only include questions whose answers materially impact adaptive architecture, contextual data modeling, adaptive task decomposition, context-specific test design, UX behavior across contexts, operational readiness across contexts, or compliance validation across contexts.
    - Ensure category coverage balance: attempt to cover the highest impact unresolved categories first; avoid asking two low-impact questions when a single high-impact area (e.g., security posture across contexts) is unresolved.
    - Exclude questions already answered, trivial stylistic preferences, or plan-level execution details (unless blocking correctness).
    - Favor clarifications that reduce downstream rework risk, prevent misaligned acceptance tests, or improve adaptation effectiveness.
    - If more than 5 categories remain unresolved, select the top 5 by (Impact * Uncertainty) heuristic, prioritizing adaptation-related categories.

4. Sequential questioning loop (interactive with adaptive focus):
    - Present EXACTLY ONE question at a time with adaptive considerations.
    - For multiple‑choice questions:
       - **Analyze all options** and determine the **most suitable option** based on:
          - Best practices for adaptive systems
          - Common patterns in similar adaptive implementations
          - Risk reduction (security, performance, maintainability across contexts)
          - Adaptation effectiveness and learning potential
          - Alignment with any explicit project goals or adaptive constraints visible in the spec
       - Present your **recommended option prominently** at the top with clear reasoning (1-2 sentences explaining why this is the best choice for adaptation).
       - Format as: `**Recommended:** Option [X] - <reasoning for adaptation effectiveness>`
       - Then render all options as a Markdown table:

       | Option | Description | Adaptation Implications |
       |--------|-------------|------------------------|
       | A | <Option A description> | <How this affects adaptation> |
       | B | <Option B description> | <How this affects adaptation> |
       | C | <Option C description> | <How this affects adaptation> (add D/E as needed up to 5) |
       | Short | Provide a different short answer (<=5 words) | <How this affects adaptation> (Include only if free-form alternative is appropriate) |

       - After the table, add: `You can reply with the option letter (e.g., "A"), accept the recommendation by saying "yes" or "recommended", or provide your own short answer.`
    - For short‑answer style (no meaningful discrete options):
       - Provide your **suggested answer** based on best practices and context-aware adaptability.
       - Format as: `**Suggested:** <your proposed answer> - <brief reasoning for adaptation effectiveness>`
       - Then output: `Format: Short answer (<=5 words). You can accept the suggestion by saying "yes" or "suggested", or provide your own answer.`
    - After the user answers:
       - If the user replies with "yes", "recommended", or "suggested", use your previously stated recommendation/suggestion as the answer.
       - Otherwise, validate the answer maps to one option or fits the <=5 word constraint.
       - If ambiguous, ask for a quick disambiguation (count still belongs to same question; do not advance).
       - Once satisfactory, record it in working memory (do not yet write to disk) and move to the next queued question.
    - Stop asking further questions when:
       - All critical ambiguities resolved early (remaining queued items become unnecessary), OR
       - User signals completion ("done", "good", "no more"), OR
       - You reach 5 asked questions.
    - Never reveal future queued questions in advance.
    - If no valid questions exist at start, immediately report no critical ambiguities.

5. Adaptive Integration after EACH accepted answer (incremental update approach):
    - Maintain in-memory representation of the adaptive spec (loaded once at start) plus the raw file contents.
    - For the first integrated answer in this session:
       - Ensure a `## Adaptive Clarifications` section exists (create it just after the highest-level contextual/overview section per the adaptive spec template if missing).
       - Under it, create (if not present) a `### Session YYYY-MM-DD` subheading for today.
    - Append a bullet line immediately after acceptance: `- Q: <question> → A: <final answer> (Adaptation: <how this affects system adaptation>)`.
    - Then immediately apply the clarification to the most appropriate section(s) with adaptive considerations:
       - Adaptive functional ambiguity → Update or add a bullet in Adaptive Functional Requirements.
       - Context-aware user interaction / actor distinction → Update User Stories or Actors subsection (if present) with clarified role, constraint, or scenario across contexts.
       - Adaptive data shape / entities → Update Data Model (add fields, types, relationships that can evolve) preserving ordering; note added constraints succinctly with adaptation implications.
       - Adaptive non-functional constraint → Add/modify measurable criteria in Adaptive Non-Functional / Quality Attributes section (convert vague adjective to metric or explicit target that can adapt to context).
       - Adaptive edge case / negative flow → Add a new bullet under Adaptive Edge Cases / Context-Aware Error Handling (or create such subsection if template provides placeholder for it).
       - Adaptive terminology conflict → Normalize term across spec; retain original only if necessary by adding `(formerly referred to as "X")` once.
    - If the clarification invalidates an earlier ambiguous statement, replace that statement instead of duplicating; leave no obsolete contradictory text.
    - Save the spec file AFTER each integration to minimize risk of context loss (atomic overwrite).
    - Preserve formatting: do not reorder unrelated sections; keep heading hierarchy intact.
    - Keep each inserted clarification minimal and testable (avoid narrative drift) while emphasizing adaptation considerations.

6. Adaptive Validation (performed after EACH write plus final pass):
   - Adaptive clarifications session contains exactly one bullet per accepted answer (no duplicates).
   - Total asked (accepted) questions ≤ 5.
   - Updated sections contain no lingering vague placeholders the new answer was meant to resolve.
   - No contradictory earlier statement remains (scan for now-invalid alternative choices removed).
   - Markdown structure valid; only allowed new headings: `## Adaptive Clarifications`, `### Session YYYY-MM-DD`.
   - Terminology consistency: same canonical term used across all updated sections.
   - Adaptation implications properly considered in all clarifications.

7. Write the updated adaptive spec back to `FEATURE_SPEC`.

8. Report completion (after questioning loop ends or early termination):
   - Number of questions asked & answered.
   - Path to updated spec.
   - Sections touched (list names).
   - Coverage summary table listing each taxonomy category with Status: Resolved (was Partial/Missing and addressed), Deferred (exceeds question quota or better suited for planning), Clear (already sufficient), Outstanding (still Partial/Missing but low impact).
   - If any Outstanding or Deferred remain, recommend whether to proceed to `/arckit.plan` or run `/arckit.analyze` again later post-plan.
   - Suggested next command with adaptive focus.

## Next Step Recommendation

Now that your adaptive clarifications are complete, the most logical next step is:

- **Primary**: Run `/arckit.plan` to create an implementation plan based on your clarified and improved specification
- **Alternative**: Run `/arckit.analyze` to analyze the updated specification again if significant changes were made

The `/arckit.plan` command will create an implementation plan that incorporates the clarifications you've added to your specification.

**Pro tip**: The clarifications you've made will help ensure your implementation plan addresses potential ambiguities and adaptation considerations upfront.

Behavior rules:

- If no meaningful ambiguities found (or all potential questions would be low-impact), respond: "No critical ambiguities detected worth formal clarification." and suggest proceeding.
- If spec file missing, instruct user to run `/arckit.define` first (do not create a new spec here).
- Never exceed 5 total asked questions (clarification retries for a single question do not count as new questions).
- Avoid speculative tech stack questions unless the absence blocks functional clarity or adaptation effectiveness.
- Respect user early termination signals ("stop", "done", "proceed").
- If no questions asked due to full coverage, output a compact coverage summary (all categories Clear) then suggest advancing.
- If quota reached with unresolved high-impact categories remaining, explicitly flag them under Deferred with rationale emphasizing adaptation impact.

Context for adaptive prioritization: {ARGS}
