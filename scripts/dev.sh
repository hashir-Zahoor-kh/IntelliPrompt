#!/usr/bin/env bash
set -euo pipefail

echo "🚀 Starting IntelliPrompt development environment..."

# Check prerequisites
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed"
    exit 1
fi

if ! command -v java &> /dev/null; then
    echo "❌ Java is not installed"
    exit 1
fi

# Start Docker services
echo "📦 Starting Docker services..."
docker-compose -f docker-compose.dev.yml up -d

# Wait for services to be healthy
echo "⏳ Waiting for services..."
sleep 5

# Build the project
echo "🔨 Building project..."
./gradlew build -x test

echo "✅ Development environment ready!"
echo ""
echo "Available services:"
echo "  - PostgreSQL: localhost:5432"
echo "  - Redis: localhost:6379"
echo "  - Ollama: localhost:11434"
echo "  - Backend: localhost:8080"
echo ""
echo "Run 'make test' to run tests"
echo "Run 'make docker-logs' to view logs"
