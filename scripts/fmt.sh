#!/usr/bin/env bash
set -euo pipefail

echo "🎨 Formatting code..."

# Format Java code with Spotless
./gradlew spotlessApply

# Format Kotlin build scripts
./gradlew :build-logic:spotlessApply

echo "✅ Code formatted successfully!"
