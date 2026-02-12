# Local Development Runbook

## Prerequisites

- Java 21 JDK
- Docker Desktop
- GraalVM (optional, for native builds)

## Initial Setup

```bash
# Clone repository
git clone https://github.com/hashir-Zahoor-kh/IntelliPrompt.git
cd IntelliPrompt

# Copy environment template
cp .env.example .env

# Edit .env with your API keys
nano .env

# Start development environment
make dev
```

## Development Workflow

### Running the CLI

```bash
# Build and run
./gradlew :intelliprompt-cli:run --args="--help"

# Or use installDist
./gradlew installDist
./intelliprompt-cli/build/install/intelliprompt-cli/bin/intelliprompt-cli
```

### Running the TUI

```bash
./gradlew :intelliprompt-tui:run
```

### Running the Backend

```bash
./gradlew :intelliprompt-backend:bootRun
```

## Testing

```bash
# Run all tests
make test

# Run specific module tests
./gradlew :intelliprompt-core:test

# Run with coverage
./gradlew test jacocoTestReport
open build/reports/jacoco/test/html/index.html
```

## Code Quality

```bash
# Format code
make fmt

# Run linters
make lint

# Run all checks
./gradlew check
```

## Debugging

### IntelliJ IDEA

1. Import as Gradle project
2. Set JDK to Java 21
3. Run/Debug configurations auto-generated

### VS Code

```json
{
  "type": "java",
  "request": "launch",
  "mainClass": "com.intelliprompt.cli.Main",
  "projectName": "intelliprompt-cli"
}
```

## Docker Development

```bash
# Start services
make docker-up

# View logs
make docker-logs

# Stop services
make docker-down

# Rebuild backend
docker-compose -f docker-compose.dev.yml build backend
```

## Troubleshooting

### Build Fails

```bash
# Clean and rebuild
make clean
make build
```

### Docker Issues

```bash
# Reset Docker
make docker-down
docker system prune -af
make docker-up
```

### Native Image Issues

```bash
# Ensure GraalVM is active
java -version  # Should show GraalVM

# Clean native build
rm -rf */build/native
make native
```
