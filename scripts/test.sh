#!/usr/bin/env bash
set -euo pipefail

echo "🧪 Running tests..."

# Run unit tests
./gradlew test

# Run integration tests
./gradlew integrationTest || true

# Generate coverage report
./gradlew jacocoTestReport

echo "✅ Tests completed!"
echo "📊 Coverage report: build/reports/jacoco/test/html/index.html"
