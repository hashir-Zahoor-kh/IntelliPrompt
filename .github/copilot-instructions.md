# Copilot Instructions for IntelliPrompt

<!-- Use this file to provide workspace-specific custom instructions to Copilot. For more details, visit https://code.visualstudio.com/docs/copilot/copilot-customization#_use-a-githubcopilotinstructionsmd-file -->

## Project Context

IntelliPrompt is a Java 21 multi-module Gradle project built with GraalVM native image support. It's an intelligent terminal assistant with deployment capabilities.

## Code Style

- Use Java 21 features (records, sealed classes, pattern matching, virtual threads)
- Follow Google Java Style Guide
- Prefer immutability
- Use descriptive variable names
- Write comprehensive Javadoc for public APIs

## Architecture Patterns

- Use dependency injection for module wiring
- Separate concerns: core logic, API, UI, deployment
- Keep templates as pure resources
- Use event-driven architecture for PTY communication

## Testing

- Write JUnit 5 tests
- Use AssertJ for assertions
- Mock external dependencies with Mockito
- Aim for >80% code coverage
- Include integration tests with Testcontainers

## Dependencies

- Consult `gradle/libs.versions.toml` for version management
- Prefer well-maintained libraries
- Consider GraalVM native image compatibility

## Security

- Never hardcode credentials
- Mask secrets in logs
- Validate all user inputs
- Follow OWASP guidelines
