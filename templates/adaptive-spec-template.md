# Adaptive Feature Specification: [FEATURE NAME]

**Feature Branch**: `[###-feature-name]`
**Created**: [DATE]
**Status**: Draft
**Input**: User description: "$ARGUMENTS"
**Evolution Plan**: [Reference to evolution scenarios and adaptability plans]
**Context Dependencies**: [List of environments and contexts this feature must support]

## User Scenarios & Adaptive Testing

<!--
  IMPORTANT: User stories should be PRIORITIZED as user journeys ordered by importance.
  Each user story/journey must be INDEPENDENTLY TESTABLE - meaning if you implement just ONE of them,
  you should still have a viable MVP (Minimum Viable Product) that delivers value.

  Assign priorities (P1, P2, P3, etc.) to each story, where P1 is the most critical.
  Think of each story as a standalone slice of functionality that can be:
  - Developed independently
  - Tested independently
  - Deployed independently
  - Demonstrated to users independently
  - Evolved independently
-->

### User Story 1 - [Brief Title] (Priority: P1)

[Describe this user journey in plain language]

**Why this priority**: [Explain the value and why it has this priority level]

**Independent Test**: [Describe how this can be tested independently]

**Adaptive Considerations**: [How might this user story need to evolve over time?]

**Acceptance Scenarios**:

1. **Given** [initial state], **When** [user action], **Then** [expected outcome]
2. **Given** [different state], **When** [user action], **Then** [expected outcome]
3. **Given** [edge case], **When** [user action], **Then** [expected outcome]

**Evolution Scenarios**:

1. **If requirement changes to [X]**: [How this story might need to adapt]
2. **If user base grows by [Y]**: [How this story scales]
3. **If context changes to [Z]**: [How this story adapts to different environments]

---

### User Story 2 - [Brief Title] (Priority: P2)

[Describe this user journey in plain language]

**Why this priority**: [Explain the value and why it has this priority level]

**Independent Test**: [Describe how this can be tested independently]

**Adaptive Considerations**: [How might this user story need to evolve over time?]

**Acceptance Scenarios**:

1. **Given** [initial state], **When** [user action], **Then** [expected outcome]
2. **Given** [edge case], **When** [user action], **Then** [expected outcome]

**Evolution Scenarios**:

1. **If requirement changes to [X]**: [How this story might need to adapt]
2. **If user base grows by [Y]**: [How this story scales]

---

[Add more user stories as needed, each with an assigned priority and evolution considerations]

### Adaptive Edge Cases

<!--
  ACTION REQUIRED: The content in this section represents placeholders.
  Fill them out with the right edge cases.
  Consider: How will edge cases change as requirements evolve?
-->

- What happens when [input is invalid] and system needs to adapt to new data formats?
- How does system handle [high load] and adapt to scaling requirements?
- What if [dependency fails] and we need to switch to alternative services?
- How does system behave when [user abandons operation] and their requirements change?
- What happens when [requirements evolve] and the original edge case logic no longer applies?

## Adaptive Requirements *(mandatory)*

<!--
  ACTION REQUIRED: The content in this section represents placeholders.
  Fill them out with the right functional requirements.
  Each requirement should include adaptability considerations.
-->

### Adaptive Functional Requirements

- **FR-001**: System MUST [specific capability] with ability to [adapt to future changes]
- **FR-002**: System MUST [specific capability] with evolution path for [future enhancements]
- **FR-003**: Users MUST be able to [key interaction] with [flexibility for requirement changes]
- **FR-004**: System MUST [data handling capability] supporting [schema evolution strategies]
- **FR-005**: System MUST [security or performance requirement] with [adaptability measures]

*Example of marking unclear requirements:*

- **FR-006**: System MUST [behavior] based on [NEEDS CLARIFICATION: specific requirement not specified] with [evolution considerations]
- **FR-007**: System MUST [behavior] [NEEDS CLARIFICATION: specific requirement not specified] with [adaptation strategy]

### Adaptive Key Entities *(include if feature involves data)*

- **[Entity 1]**: [What it represents, key attributes, relationships to other entities] with [schema evolution plan] and [migration strategies]
- **[Entity 2]**: [What it represents, key attributes, relationships to other entities] with [flexibility for future attributes] and [backward compatibility plan]

## Adaptive Success Criteria

<!--
  ACTION REQUIRED: Define measurable success criteria.
  These must be technology-agnostic, measurable, verifiable, AND adaptable to changing requirements.
  Include both current success metrics and how success will be measured as requirements evolve.
-->

### Current Measurable Outcomes

- **SO-001**: [Metric, e.g., "Users can complete account creation in under 2 minutes"]
- **SO-002**: [Metric, e.g., "System handles 1000 concurrent users"]
- **SO-003**: [Metric, e.g., "User satisfaction score of 4.5/5 or higher"]

### Evolution Success Criteria

- **ES-001**: [How success will be measured as user base scales: e.g., "Maintains performance as user base grows 10x"]
- **ES-002**: [How success adapts to changing requirements: e.g., "Successfully incorporates 3 new features per quarter with minimal refactoring"]
- **ES-003**: [How adaptability is measured: e.g., "Requirements can be modified with less than 2 weeks of engineering time"]

## Adaptive Assumptions and Dependencies

### Adaptive Assumptions

- [List assumptions made during specification and how they might change]
- [What conditions are assumed to be true and how to handle changes]
- [What external factors are assumed to remain stable and adaptation plans if they change]

### Adaptive Dependencies

- [List external dependencies needed for this feature and alternative strategies if they change]
- [APIs, services, or other features this depends on with migration paths]
- [Any third-party services or libraries required with vendor lock-in avoidance strategies]

### Evolution Scenarios

- **Scenario 1**: [What if core business requirements change? - Include adaptation strategy]
- **Scenario 2**: [What if user needs evolve significantly? - Include adaptation strategy]
- **Scenario 3**: [What if technology landscape changes? - Include migration strategy]
- **Scenario 4**: [What if regulatory requirements change? - Include compliance adaptation strategy]

## Adaptive Quality Considerations

### Testability Requirements

- Each user story must be independently testable in isolation
- System must support testing of evolution scenarios (how feature behaves when requirements change)
- All acceptance scenarios must include verification of adaptability

### Performance Adaptability

- System performance requirements must account for evolutionary changes
- Scalability requirements must consider adaptation overhead
- Latency requirements must include time for configuration updates

### Security Adaptability

- Security requirements must account for change in requirements over time
- Access control must support evolution of user roles and permissions
- Data protection must account for schema evolution

## Migration and Deployment Considerations

### Backward Compatibility

- How will existing users be affected by changes?
- What migration paths will be provided?
- How will data schemas evolve while maintaining compatibility?

### Deployment Strategies

- How will the feature be deployed across different contexts/environments?
- How will changes be rolled out gradually to minimize disruption?
- How will the system handle A/B testing of new evolutionary features?

### Monitoring and Feedback

- How will the system's adaptability be monitored?
- What metrics will indicate successful adaptation to changing requirements?
- How will user feedback inform evolutionary changes?
