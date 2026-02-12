#!/usr/bin/env bash
set -euo pipefail

echo "🔨 Building GraalVM native image..."

# Check if GraalVM is installed
if ! command -v native-image &> /dev/null; then
    echo "❌ GraalVM native-image is not installed"
    echo "Install with: gu install native-image"
    exit 1
fi

# Build with native profile
./gradlew :intelliprompt-cli:nativeCompile
./gradlew :intelliprompt-tui:nativeCompile

echo "✅ Native images built successfully!"
echo "CLI: intelliprompt-cli/build/native/nativeCompile/intelliprompt-cli"
echo "TUI: intelliprompt-tui/build/native/nativeCompile/intelliprompt-tui"
