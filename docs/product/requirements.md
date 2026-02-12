# Product Requirements

## Vision

IntelliPrompt is an intelligent terminal assistant that helps developers safely execute commands and deploy applications with AI-powered guidance.

## Core Requirements

### FR1: Command Assistance
- Intercept terminal commands before execution
- Provide AI-powered explanations and suggestions
- Detect and warn about risky operations

### FR2: Risk Analysis
- Analyze commands for security risks
- Classify risk levels (low, medium, high, critical)
- Require explicit confirmation for high-risk commands

### FR3: Deployment Orchestration
- Scan project to detect framework/language
- Generate deployment configurations (Docker, K8s, Terraform)
- Execute deployment with progress tracking

### FR4: Multi-Modal Interface
- CLI for simple commands
- TUI for interactive sessions
- Backend API for integrations

### FR5: Context Awareness
- Maintain session context
- Track command history
- Understand project structure

## Non-Functional Requirements

See [nfrs.md](nfrs.md)

## Success Metrics

- Command interception latency: <50ms
- Risk detection accuracy: >95%
- Deployment success rate: >90%
- User satisfaction: >4.5/5
