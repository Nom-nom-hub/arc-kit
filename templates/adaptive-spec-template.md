# Adaptive Feature Specification: [FEATURE NAME]

**Feature Branch**: `[###-feature-name]`
**Created**: [DATE]
**Status**: Draft
**Input**: User description: "$ARGUMENTS"

## User Scenarios & Testing *(adaptive)*

<!--
  IMPORTANT: User stories should be PRIORITIZED as adaptive user journeys ordered by importance.
  Each user story/journey must be INDEPENDENTLY TESTABLE across different contexts and
  able to ADAPT to changing requirements - meaning if you implement just ONE of them,
  you should still have a viable MVP (Minimum Viable Product) that delivers value and can evolve.

  Assign priorities (P1, P2, P3, etc.) to each story, where P1 is the most critical.
  Think of each story as a standalone slice of functionality that can be:
  - Developed independently
  - Tested independently across contexts
  - Deployed independently
  - Demonstrated to users independently
  - Adapted to changing requirements independently
-->

### User Story 1 - [Brief Title] (Priority: P1)

[Describe this user journey in plain language with adaptive considerations]

**Why this priority**: [Explain the value and why it has this priority level]

**Independent Test**: [Describe how this can be tested independently across different contexts]

**Context-Aware Acceptance Scenarios**:

1. **Given** [initial context], **When** [action in context], **Then** [expected adaptive outcome]
2. **Given** [different context], **When** [action in context], **Then** [expected adaptive outcome]
3. **Given** [evolving requirement], **When** [adaptation trigger], **Then** [adaptive response]

---

### User Story 2 - [Brief Title] (Priority: P2)

[Describe this user journey in plain language with adaptive considerations]

**Why this priority**: [Explain the value and why it has this priority level]

**Independent Test**: [Describe how this can be tested independently across different contexts]

**Context-Aware Acceptance Scenarios**:

1. **Given** [initial context], **When** [action in context], **Then** [expected adaptive outcome]
2. **Given** [evolving requirement], **When** [adaptation trigger], **Then** [adaptive response]

---

[Add more user stories as needed, each with an assigned priority and adaptive considerations]

### Adaptive Edge Cases

<!--
  ACTION REQUIRED: The content in this section represents placeholders.
  Fill them out with the right adaptive edge cases.
-->

- What happens when [context changes suddenly]?
- How does system handle [requirement evolution]?
- What if [adaptation fails]?
- How does system behave when [feedback indicates change needed]?

## Adaptive Requirements *(mandatory)*

<!--
  ACTION REQUIRED: The content in this section represents placeholders.
  Fill them out with the right adaptive functional requirements.
-->

### Adaptive Functional Requirements

- **AFR-001**: System MUST [specific capability that can adapt to context]
- **AFR-002**: System MUST [capability that evolves with requirements]
- **AFR-003**: Users MUST be able to [key interaction that adapts to context]
- **AFR-004**: System MUST [adaptive data persistence that evolves]
- **AFR-005**: System MUST [context-aware behavior that learns from usage]

*Example of marking unclear adaptive requirements:*

- **AFR-006**: System MUST adapt user interface based on [NEEDS CLARIFICATION: adaptation criteria not specified - user behavior, device context, usage patterns?]
- **AFR-007**: System MUST evolve recommendations based on [NEEDS CLARIFICATION: feedback mechanism not specified]

### Adaptive Key Entities *(include if feature involves data)*

- **[Entity 1]**: [What it represents, key attributes that can evolve, relationships to other entities]
- **[Entity 2]**: [What it represents, attributes that adapt to context, relationships that evolve]

### Adaptation Mechanisms

- **AM-001**: How the system detects [context change / requirement evolution / user behavior shift]
- **AM-002**: How the system responds to [detected change] with [adaptive action]
- **AM-003**: How the system learns from [user feedback / usage patterns / environmental changes]

## Success Criteria *(adaptive)*

<!--
  ACTION REQUIRED: Define measurable adaptive success criteria.
  These must be technology-agnostic, measurable, and able to evolve with changing requirements.
-->

### Adaptive Measurable Outcomes

- **ASO-001**: [Context-aware metric, e.g., "Users can complete account creation in under 2 minutes in normal context, 3 minutes in high-traffic context"]
- **ASO-002**: [Adaptation metric, e.g., "System handles 1000 concurrent users normally, adapts to handle 1500 during peak with slight performance trade-off"]
- **ASO-003**: [Learning metric, e.g., "System adaptation improves user satisfaction by 10% within 30 days of deployment"]
- **ASO-004**: [Evolution metric, e.g., "System successfully adapts to new user behavior patterns within 7 days of detection"]

### Adaptation Validation Criteria

- **AVC-001**: [How to validate that adaptation is working effectively]
- **AVC-002**: [How to measure that evolution is improving the system]
- **AVC-003**: [Metrics for determining when adaptation fails and fallbacks are needed]

## Context Considerations *(adaptive)*

### Context Types

- **User Context**: [How the system adapts to different user types/profiles]
- **Environmental Context**: [How the system adapts to different usage environments]
- **Temporal Context**: [How the system adapts to different times/usage patterns]
- **Load Context**: [How the system adapts to varying load conditions]

### Adaptation Triggers

- **Trigger 1**: [What causes the system to adapt]
- **Trigger 2**: [What conditions trigger adaptation]
- **Trigger 3**: [What feedback indicates need for evolution]

### Adaptation Constraints

- **AC-001**: [What should NOT change during adaptation]
- **AC-002**: [Constraints on how much the system can adapt]
- **AC-003**: [Safety bounds for adaptation]

## Learning & Improvement *(adaptive)*

### Feedback Mechanisms

- **FM-001**: [How the system collects feedback on its performance]
- **FM-002**: [How user behavior is monitored for adaptation triggers]
- **FM-003**: [How system effectiveness is measured]

### Improvement Opportunities

- **IO-001**: [Where the system can improve through adaptation]
- **IO-002**: [How the system can learn from its mistakes]
- **IO-003**: [How to incorporate lessons learned into future behavior]
