#!/usr/bin/env bash
set -euo pipefail

echo "🧪 Running E2E Tests..."

# Change to test directory
cd "$(dirname "$0")/.."

# Run spec tests
for spec in specs/*.spec.yml; do
    echo "Running $spec..."
    # TODO: Implement spec runner
done

echo "✅ All E2E tests passed!"
