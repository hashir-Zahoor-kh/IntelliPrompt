# IntelliPrompt Architecture

## Overview

IntelliPrompt is designed as a modular, multi-tier system with clear separation of concerns.

## System Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    User Interface Layer                 │
│  ┌─────────────┐              ┌─────────────┐          │
│  │     CLI     │              │     TUI     │          │
│  │  (picocli)  │              │  (Lanterna) │          │
│  └─────────────┘              └─────────────┘          │
└─────────────────────────────────────────────────────────┘
                          │
┌─────────────────────────────────────────────────────────┐
│                   Application Layer                     │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐    │
│  │   Deploy    │  │     API     │  │   Backend   │    │
│  │ Orchestrator│  │   Client    │  │ (Spring Boot)│   │
│  └─────────────┘  └─────────────┘  └─────────────┘    │
└─────────────────────────────────────────────────────────┘
                          │
┌─────────────────────────────────────────────────────────┐
│                      Core Layer                         │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐    │
│  │   Context   │  │     PTY     │  │    Risk     │    │
│  │   Engine    │  │   Manager   │  │   Engine    │    │
│  └─────────────┘  └─────────────┘  └─────────────┘    │
└─────────────────────────────────────────────────────────┘
                          │
┌─────────────────────────────────────────────────────────┐
│                   Infrastructure                        │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐    │
│  │  Templates  │  │   Config    │  │   Shared    │    │
│  │  (Resources)│  │   Manager   │  │   Models    │    │
│  └─────────────┘  └─────────────┘  └─────────────┘    │
└─────────────────────────────────────────────────────────┘
```

## Module Dependencies

- **intelliprompt-cli**: Depends on core, deploy
- **intelliprompt-tui**: Depends on core, deploy
- **intelliprompt-deploy**: Depends on core, templates, api
- **intelliprompt-core**: Depends on shared
- **intelliprompt-api**: Depends on shared
- **intelliprompt-backend**: Depends on api, core
- **intelliprompt-templates**: Pure resources, no dependencies
- **intelliprompt-shared**: No dependencies

## Key Design Decisions

See [ADR directory](adr/) for architectural decision records.

## Technology Stack

- **Runtime**: Java 21 with Virtual Threads
- **Build**: Gradle with Kotlin DSL
- **Native**: GraalVM Native Image
- **PTY**: pty4j
- **TUI**: Lanterna
- **Backend**: Spring Boot 3.x
- **Testing**: JUnit 5, Testcontainers
