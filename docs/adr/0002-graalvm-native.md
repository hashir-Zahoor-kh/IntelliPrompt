# ADR 0002: GraalVM Native Image

## Status

Accepted

## Context

CLI tools need fast startup times. Traditional JVM startup (100-500ms) is too slow for responsive terminal interaction.

## Decision

We will use GraalVM Native Image to compile ahead-of-time to native binaries.

## Rationale

### Pros
- **Instant Startup**: <10ms startup time
- **Low Memory**: ~10x less memory than JVM
- **Single Binary**: Easy distribution
- **Security**: Reduced attack surface

### Cons
- Build time overhead (2-5 minutes)
- Reflection requires configuration
- Some libraries incompatible
- Platform-specific builds required

## Implementation

1. Use `native-image-maven-plugin` or Gradle equivalent
2. Provide reachability metadata for reflection
3. Test thoroughly (native behavior differs from JVM)
4. CI/CD builds for Linux, macOS, Windows

## Alternatives Considered

1. **Standard JVM**: Too slow startup
2. **JLink**: Better than JVM but still ~50-100ms startup
3. **Different Language**: Would lose Java ecosystem benefits

## Consequences

- Must maintain reflection configuration
- Build pipeline more complex
- Faster user experience
- Easier distribution (single binary)
