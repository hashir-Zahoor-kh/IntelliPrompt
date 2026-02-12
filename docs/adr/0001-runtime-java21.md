# ADR 0001: Java 21 Runtime

## Status

Accepted

## Context

We need to choose a runtime platform for IntelliPrompt that provides:
- Strong performance characteristics
- Modern concurrency primitives
- Native compilation support
- Rich ecosystem for terminal/PTY interaction

## Decision

We will use Java 21 as the primary runtime platform.

## Rationale

### Pros
- **Virtual Threads**: Lightweight concurrency for handling multiple streams
- **Pattern Matching**: Modern syntax for cleaner code
- **Records**: Immutable data classes for DTOs
- **Sealed Classes**: Type-safe domain modeling
- **GraalVM Support**: Native image compilation for fast startup
- **Mature PTY Libraries**: pty4j provides robust terminal control
- **Strong Typing**: Compile-time safety for complex workflows

### Cons
- Larger binary size than Go/Rust
- GC overhead (mitigated by GraalVM)
- Steeper learning curve for contributors unfamiliar with Java

## Alternatives Considered

1. **Go**: Simpler deployment, but weaker type system
2. **Rust**: Best performance, but slower development velocity
3. **Python**: Easier scripting, but poor concurrency and packaging

## Consequences

- Development team needs Java 21 expertise
- Build times may be longer than scripting languages
- Native image compilation requires GraalVM setup
- Excellent library ecosystem for terminal/deployment tooling
