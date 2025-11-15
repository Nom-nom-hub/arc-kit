---
description: Create or update the adaptive feature specification using dynamic reasoning chains and context-aware analysis.
handoffs:
  - label: Build Adaptive Technical Plan
    agent: arckit.plan
    prompt: Create an adaptive plan for the spec that can evolve with changing requirements...
  - label: Clarify Adaptive Spec Requirements
    agent: arckit.analyze
    prompt: Analyze specification requirements for adaptation readiness
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

The text the user typed after `/arckit.define` in the triggering message **is** the feature description. Assume you always have it available in this conversation even if `{ARGS}` appears literally below. Do not ask the user to repeat it unless they provided an empty command.

Given that feature description, do this:

1. **Generate a concise short name** (2-4 words) for the branch:
   - Analyze the feature description and extract the most meaningful keywords
   - Create a 2-4 word short name that captures the essence of the adaptive feature
   - Use action-noun format when possible (e.g., "add-user-auth", "fix-payment-bug", "evolve-recommendations")
   - Preserve technical terms and acronyms (OAuth2, API, JWT, etc.)
   - Keep it concise but descriptive enough to understand the feature at a glance
   - Examples:
     - "I want to add user authentication" → "user-auth"
     - "Implement adaptive recommendation system" → "adaptive-recommendations"
     - "Create a dashboard for analytics" → "analytics-dashboard"
     - "Fix payment processing timeout bug" → "fix-payment-timeout"

2. **Check for existing branches before creating new one**:

   a. First, fetch all remote branches to ensure we have the latest information:

      ```bash
      git fetch --all --prune
      ```

   b. Find the highest feature number across all sources for the short-name:
      - Remote branches: `git ls-remote --heads origin | grep -E 'refs/heads/[0-9]+-<short-name>$'`
      - Local branches: `git branch | grep -E '^[* ]*[0-9]+-<short-name>$'`
      - Specs directories: Check for directories matching `specs/[0-9]+-<short-name>`

   c. Determine the next available number:
      - Extract all numbers from all three sources
      - Find the highest number N
      - Use N+1 for the new branch number

   d. Run the script `{SCRIPT}` with the calculated number and short-name:
      - Pass `--number N+1` and `--short-name "your-short-name"` along with the feature description
      - Bash example: `{SCRIPT} --json --number 5 --short-name "user-auth" "Add user authentication"`
      - PowerShell example: `{SCRIPT} -Json -Number 5 -ShortName "user-auth" "Add user authentication"`

   **IMPORTANT**:
   - Check all three sources (remote branches, local branches, specs directories) to find the highest number
   - Only match branches/directories with the exact short-name pattern
   - If no existing branches/directories found with this short-name, start with number 1
   - You must only ever run this script once per feature
   - The JSON is provided in the terminal as output - always refer to it to get the actual content you're looking for
   - The JSON output will contain BRANCH_NAME and SPEC_FILE paths
   - For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot' (or double-quote if possible: "I'm Groot")

3. Load `templates/adaptive-spec-template.md` to understand required sections for adaptive specifications.

4. Follow this execution flow for adaptive specification creation:

    1. Parse user description from Input
       If empty: ERROR "No feature description provided"
    2. Extract key concepts from description with context awareness
       Identify: actors, actions, data, constraints, contexts
    3. For unclear aspects with adaptive reasoning:
       - Make informed guesses based on context and industry standards
       - Only mark with [NEEDS CLARIFICATION: specific question] if:
         - The choice significantly impacts feature scope or user experience
         - Multiple reasonable interpretations exist with different implications
         - No reasonable default exists
       - **LIMIT: Maximum 3 [NEEDS CLARIFICATION] markers total**
       - Prioritize clarifications by impact: scope > security/privacy > user experience > technical details
    4. Fill User Scenarios & Testing section with adaptive considerations
       If no clear user flow: ERROR "Cannot determine user scenarios"
    5. Generate Adaptive Functional Requirements
       Each requirement must be testable, verifiable, and capable of evolution
       Use reasonable defaults for unspecified details (document assumptions in Assumptions section)
    6. Define Adaptive Success Criteria
       Create measurable, technology-agnostic outcomes that can evolve
       Include both quantitative metrics (time, performance, volume) and qualitative measures (user satisfaction, task completion)
       Each criterion must be verifiable without implementation details
    7. **CRITICAL**: Define Verification Requirements for each feature (how to test/verify functionality)
       - Include specific test scenarios for each requirement
       - Define expected inputs, outputs, and behaviors
       - Specify edge cases and error conditions to validate
    8. Identify Adaptive Key Entities (if data involved) that can evolve
    9. Return: SUCCESS (adaptive spec ready for adaptive planning)

5. Write the specification to SPEC_FILE using the adaptive template structure, replacing placeholders with concrete details derived from the feature description (arguments) while preserving section order and headings.

6. **Adaptive Specification Quality Validation**: After writing the initial spec, validate it against adaptive quality criteria:

   a. **Create Adaptive Spec Quality Checklist**: Generate a checklist file at `FEATURE_DIR/checklists/requirements.md` using the checklist template structure with these adaptive validation items:

      ```markdown
      # Adaptive Specification Quality Checklist: [FEATURE NAME]

      **Purpose**: Validate adaptive specification completeness and quality before proceeding to adaptive planning
      **Created**: [DATE]
      **Feature**: [Link to spec.md]

      ## Content Quality

      - [ ] No implementation details (languages, frameworks, APIs)
      - [ ] Focused on user value and business needs
      - [ ] Written for non-technical stakeholders
      - [ ] All mandatory sections completed
      - [ ] Adaptation mechanisms clearly defined
      - [ ] Context awareness requirements specified

      ## Requirement Adaptiveness

      - [ ] No [NEEDS CLARIFICATION] markers remain
      - [ ] Requirements are testable and unambiguous
      - [ ] Requirements can evolve with changing requirements
      - [ ] Success criteria are measurable and adaptable
      - [ ] Success criteria are technology-agnostic (no implementation details)
      - [ ] All acceptance scenarios are defined
      - [ ] Edge cases are identified
      - [ ] Scope is clearly bounded but can adapt
      - [ ] Dependencies and assumptions identified

      ## Feature Adaptiveness

      - [ ] All functional requirements have clear acceptance criteria
      - [ ] User scenarios cover primary flows with adaptive considerations
      - [ ] Feature meets measurable outcomes defined in Success Criteria
      - [ ] No implementation details leak into specification
      - [ ] Adaptation triggers and pathways clearly defined
      - [ ] Context switching capabilities specified

      ## Notes

      - Items marked incomplete require spec updates before `/arckit.analyze` or `/arckit.plan`
      ```

   b. **Run Adaptive Validation Check**: Review the spec against each checklist item:
      - For each item, determine if it passes or fails
      - Document specific issues found (quote relevant spec sections)
      - Assess adaptation readiness of each section

   c. **Handle Validation Results**:

      - **If all items pass**: Mark checklist complete and proceed to step 6

      - **If items fail (excluding [NEEDS CLARIFICATION])**:
        1. List the failing items and specific issues
        2. Update the spec to address each issue with adaptive considerations
        3. Re-run validation until all items pass (max 3 iterations)
        4. If still failing after 3 iterations, document remaining issues in checklist notes and warn user

      - **If [NEEDS CLARIFICATION] markers remain**:
        1. Extract all [NEEDS CLARIFICATION: ...] markers from the spec
        2. **LIMIT CHECK**: If more than 3 markers exist, keep only the 3 most critical (by scope/security/UX impact) and make informed guesses for the rest
        3. For each clarification needed (max 3), present options to user in this format:

           ```markdown
           ## Question [N]: [Topic]

           **Context**: [Quote relevant spec section]

           **What we need to know**: [Specific question from NEEDS CLARIFICATION marker]

           **Suggested Answers**:

           | Option | Answer | Implications for Adaptation |
           |--------|--------|-----------------------------|
           | A      | [First suggested answer] | [How this affects adaptation] |
           | B      | [Second suggested answer] | [How this affects adaptation] |
           | C      | [Third suggested answer] | [How this affects adaptation] |
           | Custom | Provide your own answer | [Explain how to provide custom input] |

           **Your choice**: _[Wait for user response]_
           ```

        4. **CRITICAL - Table Formatting**: Ensure markdown tables are properly formatted:
           - Use consistent spacing with pipes aligned
           - Each cell should have spaces around content: `| Content |` not `|Content|`
           - Header separator must have at least 3 dashes: `|--------|`
           - Test that the table renders correctly in markdown preview
        5. Number questions sequentially (Q1, Q2, Q3 - max 3 total)
        6. Present all questions together before waiting for responses
        7. Wait for user to respond with their choices for all questions (e.g., "Q1: A, Q2: Custom - [details], Q3: B")
        8. Update the spec by replacing each [NEEDS CLARIFICATION] marker with the user's selected or provided answer while considering adaptation implications
        9. Re-run validation after all clarifications are resolved

   d. **Update Adaptive Checklist**: After each validation iteration, update the checklist file with current pass/fail status and adaptation readiness assessment

7. Report completion with branch name, spec file path, checklist results, and readiness for the next phase.

## Next Step Recommendation

Now that your adaptive specification is complete, the most logical next step is:

- **Primary**: Run `/arckit.analyze` to analyze your specification for consistency and adaptation readiness
- **Alternative**: Run `/arckit.plan` if you want to proceed directly to planning without analysis

The `/arckit.analyze` command will evaluate your specification against adaptive quality criteria, identify potential risks, and ensure your requirements are ready for the design phase.

**Pro tip**: If your specification has [NEEDS CLARIFICATION] markers, consider addressing them before proceeding, or use `/arckit.clarify` to systematically resolve ambiguities.

## General Guidelines

## Quick Guidelines

- Focus on **WHAT** users need and **WHY**.
- Avoid HOW to implement (no tech stack, APIs, code structure).
- Written for business stakeholders, not developers.
- Emphasize **adaptation capabilities** and **context awareness**.
- DO NOT create any checklists that are embedded in the spec. That will be a separate command.

### Section Requirements

- **Mandatory sections**: Must be completed for every feature
- **Adaptive sections**: Include only when relevant to adaptation
- When a section doesn't apply, remove it entirely (don't leave as "N/A")

### For Adaptive AI Generation

When creating this adaptive spec from a user prompt:

1. **Make informed guesses**: Use context, industry standards, and common patterns to fill gaps
2. **Document assumptions**: Record reasonable defaults in the Assumptions section
3. **Limit clarifications**: Maximum 3 [NEEDS CLARIFICATION] markers - use only for critical decisions that:
   - Significantly impact feature scope or user experience
   - Have multiple reasonable interpretations with different implications
   - Lack any reasonable default
4. **Prioritize clarifications**: scope > security/privacy > user experience > technical details
5. **Think like a tester**: Every vague requirement should fail the "testable and unambiguous" checklist item
6. **Think like an adapter**: Consider how requirements might evolve with context changes

### Success Criteria Guidelines

Adaptive success criteria must be:

1. **Measurable**: Include specific metrics (time, percentage, count, rate)
2. **Technology-agnostic**: No mention of frameworks, languages, databases, or tools
3. **User-focused**: Describe outcomes from user/business perspective, not system internals
4. **Verifiable**: Can be tested/validated without knowing implementation details
5. **Adaptable**: Capable of evolving with changing requirements
6. **Context-aware**: Sensitive to environmental changes

**Good examples**:

- "Users can complete checkout in under 3 minutes (with adaptation for high-traffic periods)"
- "System supports 10,000 concurrent users (adapting to 15,000 during peak)"
- "Users see relevant results with 95% accuracy in normal conditions and 85% in unusual contexts"
- "Task completion rate improves by 40% (with adaptation to user behavior changes)"

### Adaptation Mechanisms

When creating adaptive specifications, consider:

1. **Adaptation triggers**: What conditions cause the system to adapt?
2. **Context detection**: How does the system recognize different contexts?
3. **Evolution pathways**: How do requirements evolve over time?
4. **Feedback loops**: How does the system learn from user interactions?
5. **Fallback behaviors**: What happens when adaptation fails?
