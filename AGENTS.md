# Arc Kit Agent Integration Guide

Arc Kit is designed to work seamlessly with popular AI agents and coding assistants. This guide explains how to integrate Arc Kit with various agents and customize the experience.

## Supported AI Agents

Arc Kit supports integration with the following AI coding assistants:

- GitHub Copilot
- Claude Code (Anthropic)
- Google Gemini
- Cursor Agent
- Qwen Code
- OpenCode
- OpenAI Codex
- Windsurf AI
- Kilo Code
- Auggie
- CodeBuddy
- Amazon Q Developer
- Amp Code
- SHAI (OVH)

## Agent Configuration

When initializing an Arc Kit project, you'll be prompted to select your preferred AI agent. The system will create appropriate configuration files and context information for your chosen agent.

### Agent-Specific Features

Each agent may have specific integration features:

- **GitHub Copilot**: Context-aware suggestions based on adaptive specifications
- **Claude Code**: Enhanced reasoning chain explanations for adaptive logic
- **Cursor**: Smart context switching for different operational contexts
- **Qwen Code**: Advanced adaptive code generation capabilities

## Context Integration

Arc Kit automatically integrates with your AI agent to provide:

- **Adaptive Context**: Context that changes based on requirements evolution
- **Reasoning Chain Traceability**: Links between decisions and implementation
- **Context-Aware Suggestions**: Intelligent suggestions based on current context
- **Evolution Tracking**: Agent awareness of how requirements have evolved

## Custom Configuration

You can customize the agent integration by placing configuration files in:

- `.arckit/` - Arc Kit specific configurations
- Agent-specific directories (e.g., `.claude/`, `.cursor/`, etc.)

### Recommended Settings

Arc Kit includes recommended VS Code settings in `templates/vscode-settings.json` which optimize the development experience for adaptive reasoning chains.

## Best Practices

1. **Context Awareness**: Always consider the current context when working with the AI agent
2. **Reasoning Chain Maintenance**: Keep reasoning chains documented for AI understanding
3. **Adaptation Feedback**: Provide feedback to the system about adaptation effectiveness
4. **Incremental Adoption**: Start with basic adaptive features and expand gradually

## Troubleshooting

If you encounter issues with agent integration:

1. Verify that your AI agent is properly installed and authenticated
2. Check that Arc Kit templates are properly initialized in your project
3. Review the context information being provided to the agent
4. Consult the specific agent's documentation for any configuration requirements

For more information about specific agent integrations, see the individual agent documentation or visit the Arc Kit documentation portal.