# Contributing to Gemini-GPT Hybrid Agents

First off, thank you for considering contributing to Gemini-GPT Hybrid Agents! It's people like you that make this project such a great tool.

## 🤝 Code of Conduct

This project and everyone participating in it is governed by our Code of Conduct. By participating, you are expected to uphold this code.

## 🎯 How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check existing issues as you might find out that you don't need to create one. When you are creating a bug report, please include as many details as possible:

- **Use a clear and descriptive title**
- **Describe the exact steps to reproduce the problem**
- **Provide specific examples to demonstrate the steps**
- **Describe the behavior you observed and expected**
- **Include screenshots if relevant**
- **Include your system details** (OS, Claude version, etc.)

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, please include:

- **Use a clear and descriptive title**
- **Provide a detailed description of the suggested enhancement**
- **Provide specific examples to demonstrate the enhancement**
- **Describe the current behavior and expected behavior**
- **Explain why this enhancement would be useful**

### Creating New Agents

When creating a new agent, follow this template structure:

```markdown
---
name: agent-name
description: Clear description of what this agent does and when to use it
model: sonnet
tools: Bash, Read, Write
color: blue
---

## Core Purpose
[Describe the agent's primary responsibility]

## Capabilities
[List what the agent can do]

## Usage Examples
[Provide clear examples]

## Decision Logic
[Explain how the agent makes decisions]
```

### Pull Request Process

1. **Fork the repo** and create your branch from `main`
2. **Follow the agent structure** defined in existing agents
3. **Test your changes** thoroughly with various scenarios
4. **Update the README.md** with details of your new agent
5. **Ensure your code follows** the existing style
6. **Issue the pull request** with a clear description

## 📝 Styleguides

### Git Commit Messages

- Use the present tense ("Add feature" not "Added feature")
- Use the imperative mood ("Move cursor to..." not "Moves cursor to...")
- Limit the first line to 72 characters or less
- Reference issues and pull requests liberally after the first line

### Agent Documentation

- Use clear, concise language
- Include practical examples
- Document all configuration options
- Explain the decision-making process
- Add performance considerations

### Code Examples

- Provide working examples
- Include both simple and complex use cases
- Show expected outputs
- Document edge cases

## 🔍 Review Process

All submissions require review. We use GitHub pull requests for this purpose. Consult [GitHub Help](https://docs.github.com/en/pull-requests) for more information.

### Review Criteria

- **Functionality**: Does the agent work as described?
- **Documentation**: Is it well-documented?
- **Testing**: Has it been tested with various scenarios?
- **Security**: Does it follow security best practices?
- **Performance**: Is it optimized for performance?

## 🚀 Getting Started

1. **Set up your development environment**:
   ```bash
   git clone https://github.com/NEWBIE0413/gemini-gpt-hybrid.git
   cd gemini-gpt-hybrid
   ```

2. **Create a new branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make your changes** and test thoroughly

4. **Commit your changes**:
   ```bash
   git add .
   git commit -m "Add your descriptive commit message"
   ```

5. **Push to your fork**:
   ```bash
   git push origin feature/your-feature-name
   ```

6. **Create a Pull Request** on GitHub

## 📚 Additional Resources

- [Claude Documentation](https://docs.anthropic.com/claude)
- [Agent Development Guide](https://github.com/NEWBIE0413/gemini-gpt-hybrid/wiki/Agent-Development)
- [Testing Guidelines](https://github.com/NEWBIE0413/gemini-gpt-hybrid/wiki/Testing)

## 💬 Questions?

Feel free to open an issue with the `question` label or reach out in our [Discord community](https://discord.gg/claude-agents).

Thank you for contributing! 🎉