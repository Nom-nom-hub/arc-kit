---
description: Create or update the feature specification using iterative development principles with adaptive reasoning and evolution planning.
handoffs:
  - label: Build Technical Plan
    agent: arckit.plan
    prompt: Create an adaptive implementation plan that includes evolution strategies...
  - label: Clarify Spec Requirements
    agent: arckit.analyze
    prompt: Analyze specification requirements for clarity and adaptive feasibility
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
   - Create a 2-4 word short name that captures the essence of the feature
   - Use action-noun format when possible (e.g., "add-user-auth", "fix-payment-bug", "update-profile")
   - Preserve technical terms and acronyms (OAuth2, API, JWT, etc.)
   - Keep it concise but descriptive enough to understand the feature at a glance
   - Examples:
     - "I want to add user authentication" → "user-auth"
     - "Implement user dashboard" → "user-dashboard"
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

3. Load `templates/adaptive-spec-template.md` to understand required sections for specifications.

4. Follow this execution flow for adaptive specification creation:

    1. Parse user description from Input
       If empty: ERROR "No feature description provided"
    2. Extract key concepts from description
       Identify: actors, actions, data, constraints, requirements
    3. Apply adaptive reasoning principles:
       - Consider how requirements might evolve over time
       - Identify potential future use cases beyond current scope
       - Plan for graceful degradation and feature scaling
       - Think about how the feature might change based on user feedback or business needs
    4. For unclear aspects:
       - Make informed guesses based on context, industry standards, and adaptive patterns
       - Only mark with [NEEDS CLARIFICATION: specific question] if:
         - The choice significantly impacts feature scope, adaptability, or user experience
         - Multiple reasonable interpretations exist with different implications for evolution
         - No reasonable default exists that supports adaptability
       - **LIMIT: Maximum 3 [NEEDS CLARIFICATION] markers total**
       - Prioritize clarifications by impact: adaptability > scope > security/privacy > user experience > technical details
    5. Fill User Scenarios & Testing section
       If no clear user flow: ERROR "Cannot determine user scenarios"
    6. Generate Functional Requirements with adaptability in mind
       Each requirement must be:
       - Testable and verifiable
       - Designed to support evolution and modification
       - Clear about how it might need to adapt to changing requirements
       - Include considerations for backward compatibility where relevant
    7. Define Success Criteria with evolution metrics
       Create measurable, technology-agnostic outcomes that include:
       - Current requirements met
       - Adaptability measures (how easily requirements could change)
       - Future-proofing indicators (how well the feature handles new use cases)
       - Include both quantitative metrics (time, performance, volume) and qualitative measures (user satisfaction, task completion)
       Each criterion must be verifiable without implementation details
    8. **CRITICAL**: Define Verification Requirements for each feature (how to test/verify functionality)
       - Include specific test scenarios for each requirement
       - Define expected inputs, outputs, and behaviors
       - Specify edge cases and error conditions to validate
       - Plan for testing evolution scenarios (how features behave when requirements change)
    9. Identify Key Entities (if data involved)
       - Define entities with evolution in mind
       - Consider schema flexibility and migration strategies
       - Plan for data compatibility across feature changes
    10. Return: SUCCESS (adaptive spec ready for planning)

5. Write the specification to SPEC_FILE using the template structure, replacing placeholders with concrete details derived from the feature description (arguments) while preserving section order and headings. Ensure the spec reflects adaptive principles throughout.

6. **Adaptive Specification Quality Validation**: After writing the initial spec, validate it against adaptive quality criteria:

   a. **Create Adaptive Spec Quality Checklist**: Generate a checklist file at `FEATURE_DIR/checklists/adaptive-requirements.md` using the checklist template structure with these validation items:

      ```markdown
      # Adaptive Specification Quality Checklist: [FEATURE NAME]

      **Purpose**: Validate specification completeness, quality, and adaptability before proceeding to planning
      **Created**: [DATE]
      **Feature**: [Link to spec.md]

      ## Content Quality

      - [ ] No implementation details (languages, frameworks, APIs)
      - [ ] Focused on user value and business needs
      - [ ] Written for non-technical stakeholders
      - [ ] All mandatory sections completed
      - [ ] Requirements clearly defined and testable
      - [ ] Success criteria measurable and technology-agnostic

      ## Adaptive Design Quality

      - [ ] Requirements designed with evolution in mind
      - [ ] Clear considerations for future use cases
      - [ ] Graceful degradation strategies identified
      - [ ] Schema/data flexibility considerations addressed
      - [ ] Backward compatibility planned where relevant
      - [ ] Migration paths identified for likely requirement changes

      ## Requirement Quality

      - [ ] No [NEEDS CLARIFICATION] markers remain
      - [ ] Requirements are testable, unambiguous, and adaptable
      - [ ] Success criteria are measurable and technology-agnostic
      - [ ] All acceptance scenarios are defined with evolution in mind
      - [ ] Edge cases include adaptation scenarios
      - [ ] Scope is clearly bounded but allows for evolution
      - [ ] Dependencies and assumptions identified with adaptability considerations

      ## Feature Quality

      - [ ] All functional requirements have clear acceptance criteria
      - [ ] User scenarios cover primary flows and likely evolution paths
      - [ ] Feature meets measurable outcomes defined in Success Criteria
      - [ ] No implementation details leak into specification
      - [ ] Verification requirements include testing for adaptability

      ## Notes

      - Items marked incomplete require spec updates before `/arckit.plan`
      - Adaptability concerns should be noted and addressed before proceeding
      ```

   b. **Run Validation Check**: Review the spec against each checklist item:
      - For each item, determine if it passes or fails
      - Document specific issues found (quote relevant spec sections)
      - Pay special attention to adaptive design quality items

   c. **Handle Validation Results**:

      - **If all items pass**: Mark checklist complete and proceed to step 6

      - **If items fail (excluding [NEEDS CLARIFICATION])**:
        1. List the failing items and specific issues
        2. Update the spec to address each issue, prioritizing adaptive quality issues
        3. Re-run validation until all items pass (max 3 iterations)
        4. If still failing after 3 iterations, document remaining issues in checklist notes and warn user

      - **If [NEEDS CLARIFICATION] markers remain**:
        1. Extract all [NEEDS CLARIFICATION: ...] markers from the spec
        2. **LIMIT CHECK**: If more than 3 markers exist, keep only the 3 most critical (by adaptability/scope/security/UX impact) and make informed guesses for the rest
        3. For each clarification needed (max 3), present options to user in this format:

           ```markdown
           ## Question [N]: [Topic]

           **Context**: [Quote relevant spec section]

           **What we need to know**: [Specific question from NEEDS CLARIFICATION marker]

           **Suggested Answers**:

           | Option | Answer | Implications | Adaptability Impact |
           |--------|--------|--------------|-------------------|
           | A      | [First suggested answer] | [How this affects the feature] | [How this affects adaptability and evolution] |
           | B      | [Second suggested answer] | [How this affects the feature] | [How this affects adaptability and evolution] |
           | C      | [Third suggested answer] | [How this affects the feature] | [How this affects adaptability and evolution] |
           | Custom | Provide your own answer | [Explain how to provide custom input] | [Considerations for adaptability] |

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
        8. Update the spec by replacing each [NEEDS CLARIFICATION] marker with the user's selected or provided answer
        9. Re-run validation after all clarifications are resolved

   d. **Update Checklist**: After each validation iteration, update the checklist file with current pass/fail status

7. Report completion with branch name, spec file path, checklist results, adaptive quality assessment, and readiness for the next phase.

## Next Step Recommendation

Now that your adaptive specification is complete, the most logical next step is:

- **Primary**: Run `/arckit.analyze` to analyze your specification for consistency and adaptive feasibility
- **Alternative**: Run `/arckit.plan` if you want to proceed directly to adaptive planning without analysis

The `/arckit.analyze` command will evaluate your specification against adaptive quality criteria, identify potential evolution risks, and ensure your requirements are ready for adaptive design phase.

**Pro tip**: If your specification has [NEEDS CLARIFICATION] markers, consider addressing them before proceeding, or use `/arckit.clarify` to systematically resolve ambiguities. The adaptive nature of your specification will be a key factor in successful implementation.

## General Guidelines

## Quick Guidelines

- Focus on **WHAT** users need and **WHY**.
- Avoid HOW to implement (no tech stack, APIs, code structure).
- Written for business stakeholders, not developers.
- Focus on **clear requirements** and **measurable outcomes**.
- **CRITICAL**: Always consider **how requirements might evolve** and **how the feature might change** over time.

### Section Requirements

- **Mandatory sections**: Must be completed for every feature
- When a section doesn't apply, remove it entirely (don't leave as "N/A")

### For AI Generation

When creating this adaptive spec from a user prompt:

1. **Make informed guesses**: Use context, industry standards, and adaptive patterns to fill gaps
2. **Document assumptions**: Record reasonable defaults in the Assumptions section with adaptability considerations
3. **Limit clarifications**: Maximum 3 [NEEDS CLARIFICATION] markers - use only for critical decisions that:
   - Significantly impact feature scope, adaptability, or user experience
   - Have multiple reasonable interpretations with different implications for evolution
   - Lack any reasonable default that supports adaptability
4. **Prioritize clarifications**: adaptability > scope > security/privacy > user experience > technical details
5. **Think like a tester AND an evolution strategist**: Every vague requirement should fail the "testable and unambiguous" checklist item, and every feature should be considered for how it might need to change

### Success Criteria Guidelines

Success criteria must be:

1. **Measurable**: Include specific metrics (time, percentage, count, rate)
2. **Technology-agnostic**: No mention of frameworks, languages, databases, or tools
3. **User-focused**: Describe outcomes from user/business perspective, not system internals
4. **Verifiable**: Can be tested/validated without knowing implementation details
5. **Adaptive**: Consider how success metrics might change as requirements evolve

**Good examples**:

- "Users can complete checkout in under 3 minutes (today), with system designed to maintain performance as transaction volume increases by 300%"
- "System supports 10,000 concurrent users initially, with architecture designed to scale to 100,000 with minimal configuration changes"
- "Users see relevant results with 95% accuracy (current), with system designed to adapt to new user preferences over time"
- "Task completion rate is 85%, with system designed to improve through A/B testing and user feedback integration"

**Adaptive considerations** (always include these thoughts):

- How might success measures change over time?
- What constitutes success when the feature adapts to new requirements?
- How will the feature perform when scaled or modified?
- What are the long-term maintainability metrics?
