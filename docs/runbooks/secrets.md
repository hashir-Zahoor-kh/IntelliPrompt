# Secrets Management Runbook

## Overview

IntelliPrompt uses multiple secrets management strategies depending on environment.

## Development

### Local Secrets

```bash
# Use .env file (never commit)
cp .env.example .env
nano .env
```

### Docker Secrets

```yaml
# docker-compose.dev.yml
secrets:
  db_password:
    file: ./secrets/db_password.txt
```

## Production

### Kubernetes Secrets

```bash
# Create secret
kubectl create secret generic api-keys \
  --from-literal=openai=sk-xxx \
  --from-literal=anthropic=sk-ant-xxx \
  -n intelliprompt

# Use in deployment
env:
  - name: OPENAI_API_KEY
    valueFrom:
      secretKeyRef:
        name: api-keys
        key: openai
```

### External Secrets Operator

```yaml
apiVersion: external-secrets.io/v1beta1
kind: ExternalSecret
metadata:
  name: intelliprompt-secrets
spec:
  secretStoreRef:
    name: aws-secrets-manager
  target:
    name: api-keys
  data:
    - secretKey: openai
      remoteRef:
        key: prod/intelliprompt/openai
```

## Secret Rotation

### Rotate API Keys

```bash
# 1. Generate new key at provider
# 2. Update secret
kubectl edit secret api-keys -n intelliprompt

# 3. Restart pods
kubectl rollout restart deployment/backend -n intelliprompt

# 4. Verify
kubectl logs -n intelliprompt deployment/backend | grep "API initialized"

# 5. Revoke old key at provider
```

### Rotate Database Password

```bash
# 1. Create new password
NEW_PASS=$(openssl rand -base64 32)

# 2. Update in database
kubectl exec -it postgres-0 -n intelliprompt -- psql -U postgres
ALTER USER intelliprompt WITH PASSWORD 'new-password';

# 3. Update secret
kubectl patch secret db-credentials -n intelliprompt \
  -p '{"data":{"password":"'$(echo -n $NEW_PASS | base64)'"}}'

# 4. Restart app
kubectl rollout restart deployment/backend -n intelliprompt
```

## Access Control

### Who Has Access

- **Production Secrets**: DevOps team only
- **Staging Secrets**: Dev team
- **Development Secrets**: All developers

### Audit Access

```bash
# K8s RBAC
kubectl get rolebindings -n intelliprompt

# AWS IAM
aws iam get-role --role-name intelliprompt-secrets-reader
```

## Emergency Procedures

### Secret Leaked

1. **Immediate**: Revoke compromised secret
2. Generate new secret
3. Update all environments
4. Audit access logs
5. Post-mortem

### Lost Access

```bash
# Break-glass procedure
# Use emergency admin credentials
kubectl config use-context emergency-admin
kubectl get secrets -n intelliprompt
```
