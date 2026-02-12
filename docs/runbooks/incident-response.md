# Incident Response Runbook

## Incident Severity Levels

### P0 - Critical
- Complete service outage
- Security breach
- Data loss

### P1 - High
- Major feature broken
- Significant performance degradation
- Partial outage

### P2 - Medium
- Minor feature broken
- Moderate performance issues

### P3 - Low
- Cosmetic issues
- Documentation errors

## Response Process

### 1. Detection & Triage

```bash
# Check service health
curl https://api.intelliprompt.io/health

# Check metrics
kubectl top pods -n intelliprompt

# Check logs
kubectl logs -n intelliprompt -l app=backend --tail=100
```

### 2. Communication

- Post in #incidents Slack channel
- Update status page
- Notify stakeholders if P0/P1

### 3. Investigation

```bash
# Gather logs
kubectl logs -n intelliprompt --all-containers > incident.log

# Check recent deployments
kubectl rollout history deployment/backend -n intelliprompt

# Check resource usage
kubectl describe pod -n intelliprompt
```

### 4. Mitigation

```bash
# Rollback if needed
kubectl rollout undo deployment/backend -n intelliprompt

# Scale up if resource issue
kubectl scale deployment/backend --replicas=5 -n intelliprompt

# Emergency patch
./scripts/release.sh 1.2.5-hotfix
```

### 5. Resolution

- Verify fix
- Update incident report
- Schedule post-mortem

### 6. Post-Mortem

Template:
```markdown
## Incident Summary
- Date: 
- Duration:
- Severity:
- Impact:

## Timeline
- HH:MM - Incident detected
- HH:MM - Investigation began
- HH:MM - Root cause identified
- HH:MM - Fix deployed
- HH:MM - Incident resolved

## Root Cause

## Resolution

## Action Items
- [ ] 
- [ ] 
```

## Common Incidents

### Backend Service Down

```bash
# Check pod status
kubectl get pods -n intelliprompt

# Check pod logs
kubectl logs -n intelliprompt deployment/backend

# Restart
kubectl rollout restart deployment/backend -n intelliprompt
```

### Database Connection Issues

```bash
# Check database
kubectl exec -it postgres-0 -n intelliprompt -- psql -U intelliprompt

# Verify credentials
kubectl get secret db-credentials -n intelliprompt -o yaml
```

### High Latency

```bash
# Check metrics
kubectl top pods -n intelliprompt

# Scale up
kubectl scale deployment/backend --replicas=10 -n intelliprompt
```
