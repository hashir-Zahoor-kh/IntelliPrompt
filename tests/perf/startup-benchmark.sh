#!/usr/bin/env bash
set -euo pipefail

echo "⚡ Running Startup Benchmark..."

# Build native image if not exists
if [ ! -f "../../intelliprompt-cli/build/native/nativeCompile/intelliprompt-cli" ]; then
    echo "Building native image..."
    ../../gradlew :intelliprompt-cli:nativeCompile
fi

BINARY="../../intelliprompt-cli/build/native/nativeCompile/intelliprompt-cli"

# Warm-up
for i in {1..5}; do
    $BINARY --version > /dev/null 2>&1
done

# Benchmark
TOTAL=0
RUNS=100

echo "Running $RUNS iterations..."

for i in $(seq 1 $RUNS); do
    START=$(gdate +%s%N 2>/dev/null || date +%s%N)
    $BINARY --version > /dev/null 2>&1
    END=$(gdate +%s%N 2>/dev/null || date +%s%N)
    
    DURATION=$((END - START))
    TOTAL=$((TOTAL + DURATION))
done

AVG=$((TOTAL / RUNS / 1000000))  # Convert to ms

echo "✅ Average startup time: ${AVG}ms"

if [ $AVG -lt 100 ]; then
    echo "✅ PASS: Startup time is under 100ms"
else
    echo "❌ FAIL: Startup time exceeds 100ms"
    exit 1
fi
