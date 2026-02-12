#!/usr/bin/env bash
set -euo pipefail

echo "🔍 Running linters..."

# Check formatting
./gradlew spotlessCheck

# Run Checkstyle
./gradlew checkstyleMain checkstyleTest

# Run PMD
./gradlew pmdMain pmdTest

# Run SpotBugs
./gradlew spotbugsMain spotbugsTest

echo "✅ All linters passed!"
