# Arc Kit Quick Start Guide

This guide will help you get started with Adaptive Reasoning Chain (ARC) Development using Arc Kit.

> NEW: All automation scripts now provide both Bash (`.sh`) and PowerShell (`.ps1`) variants. The `arc` CLI auto-selects based on OS unless you pass `--script sh|ps`.

## The 6-Step ARC Process

### 1. Install Arc Kit

Initialize your project depending on the coding agent you're using:

```bash
uvx --from git+https://github.com/Nom-nom-hub/arc-kit.git arc init <PROJECT_NAME>
```

Pick script type explicitly (optional):

```bash
uvx --from git+https://github.com/Nom-nom-hub/arc-kit.git arc init <PROJECT_NAME> --script ps  # Force PowerShell
uvx --from git+https://github.com/Nom-nom-hub/arc-kit.git arc init <PROJECT_NAME> --script sh  # Force POSIX shell
```

### 2. Define with Adaptive Reasoning

Use the `/arckit.define` command to create adaptive feature specifications. Focus on the **what**, **why**, and potential **evolution paths**:

```bash
/arckit.define Build an application that can help me organize my photos in separate photo albums. Albums are grouped by date and can be re-organized by dragging and dropping on the main page. Albums are never in other nested albums. Within each album, photos are previewed in a tile-like interface. The system should adapt to my usage patterns and suggest new organization methods over time.
```

### 3. Perform Multi-Dimensional Analysis

Use the `/arckit.analyze` command to perform deep analysis across multiple dimensions:

```bash
/arckit.analyze Analyze the photo organization requirements for technical feasibility, security implications (privacy of photos), performance characteristics (loading speed), and maintainability (future feature additions)
```

### 4. Design Context-Aware Architecture

Use the `/arckit.design` command to create adaptive architecture:

```bash
/arckit.design Design the architecture using React for frontend, Node.js for backend services, with local SQLite for storage, machine learning capabilities for pattern recognition, and adaptive UI that evolves based on user preferences.
```

### 5. Create Adaptive Implementation Plan

Use the `/arckit.plan` command to create a dynamic implementation plan:

```bash
/arckit.plan Plan the implementation with React for frontend, Node.js for backend, SQLite for storage, with adaptive UI components, machine learning integration, and privacy-preserving data handling.
```

### 6. Execute Reasoning Chains

Use `/arckit.chain` to execute intelligent reasoning chains for implementation:

```bash
/arckit.chain Implement the photo organization system following adaptive reasoning principles
```

## Detailed Example: Building AdaptiveTaskify

Here's a complete example of building an adaptive team productivity platform:

### Step 1: Adaptive Feature Definition with `/arckit.define`

```text
Develop AdaptiveTaskify, a team productivity platform that learns from team behavior. It should allow users to create projects, add team members, assign tasks, comment and move tasks between boards in Kanban style. The system should adapt its interface and workflows based on team usage patterns, suggest process improvements, and predict bottlenecks. The AI should learn each team's unique patterns and adapt the Kanban workflow accordingly.
```

### Step 2: Multi-Dimensional Analysis with `/arckit.analyze`

Perform analysis across multiple dimensions:

```text
Analyze AdaptiveTaskify for:
- Technical feasibility: Can we implement adaptive UI and ML pattern recognition?
- Security implications: How do we protect sensitive project data?
- Performance: How quickly can we analyze and adapt to team patterns?
- Maintainability: How do we ensure the adaptive system remains manageable?
- Privacy: How do we handle team behavior data responsibly?
```

### Step 3: Context-Aware Design with `/arckit.design`

Create adaptive architecture:

```text
Design AdaptiveTaskify with:
- Microservices architecture for scalability
- Machine learning service for pattern analysis
- Adaptive UI framework that changes based on team behavior
- Privacy-first data handling approach
- Real-time collaboration capabilities
- Prediction engine for bottleneck detection
```

### Step 4: Adaptive Planning with `/arckit.plan`

Create a dynamic plan that can adapt:

```text
Plan AdaptiveTaskify using:
- React frontend with adaptive component framework
- Node.js backend services
- PostgreSQL for main data storage
- Redis for session and caching
- TensorFlow.js for client-side pattern recognition
- Real-time WebSocket connections for collaboration
- Privacy-compliant data storage
```

### Step 5: Execute with Reasoning Chains using `/arckit.chain`

Implement using intelligent reasoning:

```text
Implement AdaptiveTaskify following the adaptive reasoning approach
```

## Advanced ARC Commands

### `/arckit.predict` - Predictive Issue Identification

Before implementation, predict potential challenges:

```text
/arckit.predict What potential issues might arise when implementing the machine learning pattern recognition in AdaptiveTaskify?
```

### `/arckit.evolve` - Continuous Improvement Suggestions

Analyze implemented features for improvements:

```text
/arckit.evolve How could the adaptive UI components in AdaptiveTaskify be improved based on initial user feedback?
```

### `/arckit.validate` - Multi-Dimensional Validation

Validate across multiple criteria:

```text
/arckit.validate Check that AdaptiveTaskify meets functional requirements, performance standards, security guidelines, and maintainability metrics
```

## Key ARC Principles

- **Adapt with Context**: Consider how requirements might evolve over time
- **Analyze Deeply**: Examine requirements across multiple dimensions
- **Design for Evolution**: Create architectures that can adapt
- **Plan Dynamically**: Create plans that adjust to new information
- **Reason Intelligently**: Use AI-powered reasoning chains
- **Learn Continuously**: Build systems that improve over time

## Next Steps

- Read the complete methodology for in-depth guidance
- Explore the ARC command reference
- Check out more examples in the repository
- Experiment with the adaptive reasoning approach
