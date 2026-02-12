# ADR 0004: Lanterna for Terminal UI

## Status

Accepted

## Context

We need a rich terminal UI (TUI) for interactive mode that works across platforms.

## Decision

We will use Lanterna library for building the TUI.

## Rationale

### Pros
- **Pure Java**: No native dependencies
- **Cross-Platform**: Works on any terminal
- **Rich Components**: Windows, panels, lists, text boxes
- **Event-Driven**: Clean event model
- **Well-Documented**: Good examples and docs

### Cons
- Less modern than some Rust alternatives (ratatui)
- Performance overhead vs. native TUI libraries

## Alternatives Considered

1. **JLine3**: More basic, better for CLIs than full TUIs
2. **Text-IO**: Simpler but less feature-rich
3. **Different Language TUI**: Would require polyglot build

## Implementation

```java
Terminal terminal = new DefaultTerminalFactory().createTerminal();
Screen screen = new TerminalScreen(terminal);
WindowBasedTextGUI gui = new MultiWindowTextGUI(screen);

Window window = new BasicWindow("IntelliPrompt");
Panel panel = new Panel();
// Add components...
```

## Consequences

- Java-based TUI with good component library
- Consistent cross-platform rendering
- May need custom components for advanced features
- Good enough for MVP, can enhance later
