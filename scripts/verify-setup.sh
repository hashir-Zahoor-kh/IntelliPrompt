#!/usr/bin/env bash
set -euo pipefail

echo "🔍 IntelliPrompt Workspace Verification"
echo "========================================"
echo ""

ERRORS=0
WARNINGS=0

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

check_command() {
    if command -v "$1" &> /dev/null; then
        echo -e "${GREEN}✓${NC} $1 is installed"
        return 0
    else
        echo -e "${RED}✗${NC} $1 is not installed"
        ((ERRORS++))
        return 1
    fi
}

check_java_version() {
    if command -v java &> /dev/null; then
        JAVA_VERSION=$(java -version 2>&1 | head -n 1 | cut -d'"' -f2 | cut -d'.' -f1)
        if [ "$JAVA_VERSION" -ge 21 ]; then
            echo -e "${GREEN}✓${NC} Java $JAVA_VERSION is installed (>= 21 required)"
        else
            echo -e "${RED}✗${NC} Java $JAVA_VERSION is installed (21 required)"
            ((ERRORS++))
        fi
    else
        echo -e "${RED}✗${NC} Java is not installed"
        ((ERRORS++))
    fi
}

check_file() {
    if [ -f "$1" ]; then
        echo -e "${GREEN}✓${NC} $1 exists"
        return 0
    else
        echo -e "${RED}✗${NC} $1 is missing"
        ((ERRORS++))
        return 1
    fi
}

check_directory() {
    if [ -d "$1" ]; then
        echo -e "${GREEN}✓${NC} $1/ exists"
        return 0
    else
        echo -e "${YELLOW}⚠${NC} $1/ is missing"
        ((WARNINGS++))
        return 1
    fi
}

echo "Checking Prerequisites..."
echo "-------------------------"
check_command java
check_java_version
check_command gradle || echo -e "${YELLOW}⚠${NC} gradle not in PATH (will use ./gradlew)"
check_command docker
check_command git
echo ""

echo "Checking Project Structure..."
echo "-----------------------------"
check_file "build.gradle.kts"
check_file "settings.gradle.kts"
check_file "gradlew"
check_file "README.md"
check_file "LICENSE"
check_file "Makefile"
check_file ".gitignore"
check_file ".editorconfig"
check_file "docker-compose.dev.yml"
echo ""

echo "Checking Modules..."
echo "-------------------"
check_directory "intelliprompt-shared"
check_directory "intelliprompt-core"
check_directory "intelliprompt-cli"
check_directory "intelliprompt-tui"
check_directory "intelliprompt-templates"
check_directory "intelliprompt-deploy"
check_directory "intelliprompt-api"
check_directory "intelliprompt-backend"
check_directory "intelliprompt-packaging"
echo ""

echo "Checking Configuration..."
echo "-------------------------"
check_file "config/intelliprompt.yml"
check_file "config/logging.yml"
check_file "config/risk-rules.yml"
check_file "gradle/libs.versions.toml"
check_file ".env.example"
echo ""

echo "Checking Scripts..."
echo "-------------------"
check_file "scripts/dev.sh"
check_file "scripts/fmt.sh"
check_file "scripts/lint.sh"
check_file "scripts/test.sh"
check_file "scripts/release.sh"
check_file "scripts/native-image.sh"
echo ""

echo "Checking Documentation..."
echo "-------------------------"
check_file "docs/architecture.md"
check_file "docs/threat-model.md"
check_file "CONTRIBUTING.md"
check_file "WORKSPACE_SETUP.md"
echo ""

echo "Checking GitHub Workflows..."
echo "----------------------------"
check_file ".github/workflows/ci.yml"
check_file ".github/workflows/release.yml"
check_file ".github/workflows/security.yml"
check_file ".github/workflows/nightly.yml"
check_file ".github/copilot-instructions.md"
echo ""

echo "Testing Gradle..."
echo "-----------------"
if [ -x "./gradlew" ]; then
    echo -e "${GREEN}✓${NC} gradlew is executable"
    
    if ./gradlew --version &> /dev/null; then
        echo -e "${GREEN}✓${NC} Gradle wrapper works"
    else
        echo -e "${RED}✗${NC} Gradle wrapper failed"
        ((ERRORS++))
    fi
else
    echo -e "${RED}✗${NC} gradlew is not executable"
    echo "  Run: chmod +x gradlew"
    ((ERRORS++))
fi
echo ""

echo "========================================"
echo "Verification Complete!"
echo ""

if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
    echo -e "${GREEN}✓ All checks passed!${NC}"
    echo ""
    echo "Next steps:"
    echo "  1. Initialize Gradle: gradle wrapper"
    echo "  2. Build project: ./gradlew build"
    echo "  3. Run tests: make test"
    echo "  4. Start dev env: make dev"
    exit 0
elif [ $ERRORS -eq 0 ]; then
    echo -e "${YELLOW}⚠ $WARNINGS warnings found${NC}"
    echo "  Some optional components are missing but project should work"
    exit 0
else
    echo -e "${RED}✗ $ERRORS errors found${NC}"
    if [ $WARNINGS -gt 0 ]; then
        echo -e "${YELLOW}⚠ $WARNINGS warnings found${NC}"
    fi
    echo "  Please fix the errors above before continuing"
    exit 1
fi
