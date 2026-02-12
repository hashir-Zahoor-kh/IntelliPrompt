#!/usr/bin/env bash
set -euo pipefail

echo "🚀 Creating release..."

# Check if version is provided
if [ -z "${1:-}" ]; then
    echo "Usage: $0 <version>"
    exit 1
fi

VERSION=$1

echo "Version: $VERSION"

# Update version in gradle.properties
echo "version=$VERSION" > gradle.properties

# Build and test
./gradlew clean build test

# Build native images
./scripts/native-image.sh

# Create distribution archives
./gradlew assembleDist

# Generate checksums
cd intelliprompt-packaging/dist
sha256sum * > checksums.txt

echo "✅ Release $VERSION created successfully!"
