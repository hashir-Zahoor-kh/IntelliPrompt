# IntelliPrompt

A secure, intelligent terminal assistant with deployment capabilities.

## Overview

IntelliPrompt is a multi-module Java 21 application built with GraalVM native image support. It provides intelligent command assistance, risk analysis, and automated deployment workflows.

## Modules

- **intelliprompt-shared**: Common models and utilities
- **intelliprompt-core**: Core engine with PTY, risk analysis, and configuration
- **intelliprompt-cli**: Command-line interface
- **intelliprompt-tui**: Terminal UI using Lanterna
- **intelliprompt-templates**: Deployment templates (Docker, Terraform, K8s)
- **intelliprompt-deploy**: Deployment orchestration
- **intelliprompt-api**: API client and streaming support
- **intelliprompt-backend**: Spring Boot backend service
- **intelliprompt-packaging**: Native image configuration and installers

## Quick Start

```bash
# Run development environment
make dev

# Build the project
./gradlew build

# Run tests
./gradlew test

# Create native image
./gradlew nativeCompile
```

## Documentation

- [Architecture](docs/architecture.md)
- [Threat Model](docs/threat-model.md)
- [Local Development](docs/runbooks/local-dev.md)
- [ADRs](docs/adr/)

## Requirements

- Java 21+
- GraalVM (for native builds)
- Docker (for development environment)

## License

See [LICENSE](LICENSE) file for details.

## Repository

- **GitHub**: https://github.com/hashir-Zahoor-kh/IntelliPrompt
- **Issues**: https://github.com/hashir-Zahoor-kh/IntelliPrompt/issues
- **Contributing**: See [CONTRIBUTING.md](CONTRIBUTING.md)

## Author

**Hashir Zahoor** - [@hashir-Zahoor-kh](https://github.com/hashir-Zahoor-kh)
