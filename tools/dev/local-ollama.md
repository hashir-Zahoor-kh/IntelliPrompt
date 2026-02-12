# Local Ollama Development

For local development without cloud LLM APIs, you can use Ollama.

## Setup

```bash
# Install Ollama
brew install ollama  # macOS
# or visit https://ollama.ai

# Start Ollama
ollama serve

# Pull a model
ollama pull llama2
```

## Configuration

Update `config/intelliprompt.yml`:

```yaml
api:
  provider: ollama
  model: llama2
  endpoint: http://localhost:11434
```

## Docker Compose

Ollama is already included in `docker-compose.dev.yml`:

```bash
make docker-up
```

## Models

Recommended models:
- `llama2` - General purpose
- `codellama` - Code-focused
- `mistral` - Fast and efficient
