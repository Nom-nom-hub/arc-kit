---
description: Convert existing adaptive tasks into actionable, dependency-ordered GitHub issues for the feature based on available adaptive design artifacts with reasoning chain traceability.
tools: ['github/github-mcp-server/issue_write']
scripts:
  sh: scripts/bash/check-prerequisites.sh --json --require-tasks --include-tasks
  ps: scripts/powershell/check-prerequisites.ps1 -Json -RequireTasks -IncludeTasks
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

1. Run `{SCRIPT}` from repo root and parse FEATURE_DIR and AVAILABLE_DOCS list. All paths must be absolute. For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot' (or double-quote if possible: "I'm Groot").
2. From the executed script, extract the path to **tasks**.
3. Get the Git remote using `git config --get remote.origin.url` in the command line. Only proceed to next steps if the remote is a GitHub URL.
4. For each adaptive task in the list, use the GitHub MCP server to create a new issue in the repository that is representative of the Git remote, incorporating adaptive reasoning chain traceability:
   - **Adaptive Task ID**: Include original task ID (T###) in issue title or description
   - **Reasoning Chain Link**: Include traceability link to original decision/requirement
   - **Adaptation Context**: Document if this task involves adaptation logic ([ADAPT], [CONTEXT], [EVOLVE] tags)
   - **User Story Mapping**: Maintain user story association (US#) for traceability
   - **Parallel Execution**: Mark tasks that can run in parallel (P flag)
   - **Dependencies**: Document dependencies between issues based on task dependencies

5. Prioritize issues based on adaptive user story priorities (P1, P2, P3...).

6. Include adaptive quality check references where applicable. Under no circumstances ever create issues in repositories that do not match the remote URL.

## Adaptive Issue Creation Guidelines

### Issue Title Format

- For adaptive tasks: `[Adapt] [US#] Task description from tasks.md`
- For context-aware tasks: `[Context] [US#] Task description from tasks.md`
- For evolution tasks: `[Evolve] [US#] Task description from tasks.md`
- For regular tasks: `[US#] Task description from tasks.md`

### Issue Body Content

Include these sections when applicable:

**Reasoning Chain Link:**

- Link to original specification decision
- Connect to adaptation mechanism that generated this task
- Reference related tasks in the reasoning chain

**Adaptation Context:**

- What context triggers this adaptive behavior
- How this task contributes to system evolution
- Dependencies on other adaptive components

**Quality & Testing:**

- How to validate adaptation effectiveness
- Context-aware test requirements
- Performance expectations across contexts

**Dependencies:**

- Which other tasks/issues this depends on
- Which tasks depend on this completion
- Potential parallel execution opportunities

### Prioritization

- Create issues in priority order (P1 user stories first)
- Consider adaptation criticality when setting issue priority
- Mark cross-cutting adaptation tasks appropriately
