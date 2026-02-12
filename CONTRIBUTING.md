# Contributing to IntelliPrompt

Thank you for your interest in contributing to IntelliPrompt! 🎉

## Getting Started

1. **Fork the repository**: https://github.com/hashir-Zahoor-kh/IntelliPrompt
2. **Clone your fork**:
   ```bash
   git clone https://github.com/YOUR_USERNAME/IntelliPrompt.git
   cd IntelliPrompt
   ```
3. **Set up development environment**:
   ```bash
   make dev
   ```

## Development Workflow

### 1. Create a Branch
```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/issue-number-description
```

### 2. Make Your Changes
- Follow the [Code Style](#code-style) guidelines
- Write tests for new features
- Update documentation as needed

### 3. Test Your Changes
```bash
# Run tests
make test

# Run linters
make lint

# Format code
make fmt
```

### 4. Commit Your Changes
```bash
git add .
git commit -m "feat: add new feature"
```

**Commit Message Format:**
- `feat:` - New feature
- `fix:` - Bug fix
- `docs:` - Documentation changes
- `style:` - Code style changes (formatting, etc.)
- `refactor:` - Code refactoring
- `test:` - Adding or updating tests
- `chore:` - Maintenance tasks

### 5. Push and Create Pull Request
```bash
git push origin feature/your-feature-name
```

Then create a Pull Request on GitHub.

## Code Style

### Java
- Use Java 21 features (records, sealed classes, pattern matching)
- Follow Google Java Style Guide
- Use descriptive variable names
- Write Javadoc for public APIs
- Maximum line length: 120 characters

### Gradle
- Use Kotlin DSL
- Keep dependencies in `gradle/libs.versions.toml`
- Use convention plugins for shared configuration

### Documentation
- Update relevant documentation for changes
- Add examples where appropriate
- Keep README.md up to date

## Testing Guidelines

### Unit Tests
- Use JUnit 5
- Use AssertJ for assertions
- Mock external dependencies with Mockito
- Aim for >80% code coverage

### Integration Tests
- Use Testcontainers for external dependencies
- Test realistic scenarios
- Clean up resources after tests

### E2E Tests
- Add specs to `tests/e2e/specs/`
- Test complete user workflows
- Document test scenarios

## Pull Request Guidelines

### Before Submitting
- [ ] Tests pass (`make test`)
- [ ] Code is formatted (`make fmt`)
- [ ] Linters pass (`make lint`)
- [ ] Documentation is updated
- [ ] Commit messages follow convention

### PR Description
Include:
- **What**: Brief description of changes
- **Why**: Motivation for the changes
- **How**: Technical approach
- **Testing**: How you tested the changes
- **Screenshots**: If UI changes

### Review Process
- At least one approval required
- CI checks must pass
- Address review comments
- Squash commits before merge

## Project Structure

```
intelliprompt/
├─ intelliprompt-shared/      # Common models
├─ intelliprompt-core/        # Core engine
├─ intelliprompt-cli/         # CLI interface
├─ intelliprompt-tui/         # Terminal UI
├─ intelliprompt-templates/   # Deployment templates
├─ intelliprompt-deploy/      # Deployment logic
├─ intelliprompt-api/         # API client
├─ intelliprompt-backend/     # Backend service
└─ intelliprompt-packaging/   # Native image config
```

## Areas for Contribution

### Good First Issues
- Documentation improvements
- Adding deployment templates
- Writing tests
- Bug fixes

### Advanced Contributions
- New deployment platforms
- Risk engine enhancements
- Performance optimizations
- Native image improvements

## Security

- **Never commit secrets** - Use `.env.example` as template
- **Validate inputs** - Always validate user inputs
- **Mask credentials** - Use credential masking utilities
- Report security issues privately

## Questions?

- **GitHub Issues**: https://github.com/hashir-Zahoor-kh/IntelliPrompt/issues
- **Discussions**: https://github.com/hashir-Zahoor-kh/IntelliPrompt/discussions

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for making IntelliPrompt better! 🚀
