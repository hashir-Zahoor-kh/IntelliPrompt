.PHONY: help dev build test clean lint fmt release native

help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

dev: ## Start development environment
	@./scripts/dev.sh

build: ## Build all modules
	@./gradlew build

test: ## Run all tests
	@./scripts/test.sh

clean: ## Clean build artifacts
	@./gradlew clean

lint: ## Run linters
	@./scripts/lint.sh

fmt: ## Format code
	@./scripts/fmt.sh

release: ## Create a release
	@./scripts/release.sh

native: ## Build native image
	@./scripts/native-image.sh

docker-up: ## Start Docker services
	@docker-compose -f docker-compose.dev.yml up -d

docker-down: ## Stop Docker services
	@docker-compose -f docker-compose.dev.yml down

docker-logs: ## View Docker logs
	@docker-compose -f docker-compose.dev.yml logs -f

e2e: ## Run end-to-end tests
	@./tests/e2e/runner/run-e2e.sh

perf: ## Run performance benchmarks
	@./tests/perf/startup-benchmark.sh
	@./tests/perf/tui-latency-benchmark.sh

install: build ## Install locally
	@./gradlew installDist

.DEFAULT_GOAL := help
