# User Stories

## Epic: Safe Command Execution

### US-001: As a developer, I want to be warned about dangerous commands
**Acceptance Criteria**:
- System intercepts `rm -rf` commands
- Shows impact analysis before execution
- Requires explicit confirmation

### US-002: As a developer, I want command explanations
**Acceptance Criteria**:
- Can request explanation for any command
- Explanation includes what the command does
- Shows potential side effects

## Epic: Deployment Automation

### US-003: As a developer, I want to deploy my app without knowing DevOps
**Acceptance Criteria**:
- Single command to deploy
- Auto-detects framework (React, Flask, etc.)
- Generates all necessary configs

### US-004: As a developer, I want to choose deployment platform
**Acceptance Criteria**:
- Support for Vercel, Railway, AWS, GCP
- Platform-specific optimizations
- Cost estimates shown before deploy

## Epic: Interactive Terminal

### US-005: As a developer, I want a rich terminal UI
**Acceptance Criteria**:
- Full-screen TUI interface
- Keyboard navigation
- Real-time command suggestions

### US-006: As a developer, I want to see deployment progress
**Acceptance Criteria**:
- Live log streaming
- Progress indicators
- Error highlighting

## Epic: Security & Privacy

### US-007: As a developer, I want my code to stay private
**Acceptance Criteria**:
- Option for local-only LLM
- No code sent to cloud without permission
- Clear data usage policies

### US-008: As a developer, I want credential management
**Acceptance Criteria**:
- Secure API key storage
- Automatic credential masking in logs
- OS keychain integration
