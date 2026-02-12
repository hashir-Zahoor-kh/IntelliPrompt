# Release Runbook

## Pre-Release Checklist

- [ ] All tests passing
- [ ] Documentation updated
- [ ] CHANGELOG.md updated
- [ ] Version bumped in gradle.properties
- [ ] Security scan completed

## Release Process

### 1. Version Bump

```bash
# Update version
echo "version=1.2.3" > gradle.properties
git add gradle.properties
git commit -m "Bump version to 1.2.3"
```

### 2. Create Release

```bash
# Run release script
./scripts/release.sh 1.2.3

# This will:
# - Build all modules
# - Run tests
# - Create native images
# - Generate distribution archives
# - Create checksums
```

### 3. Tag Release

```bash
git tag -a v1.2.3 -m "Release version 1.2.3"
git push origin v1.2.3
```

### 4. GitHub Release

1. Go to GitHub Releases
2. Create new release from tag v1.2.3
3. Upload artifacts from `intelliprompt-packaging/dist/`
4. Copy CHANGELOG entries to release notes
5. Publish release

### 5. Verify Release

```bash
# Download and test binaries
wget https://github.com/.../intelliprompt-cli-1.2.3-linux-x64.tar.gz
tar xzf intelliprompt-cli-1.2.3-linux-x64.tar.gz
./intelliprompt-cli --version
```

## Hotfix Process

```bash
# Create hotfix branch
git checkout -b hotfix/1.2.4 v1.2.3

# Make fixes
# ...

# Release
./scripts/release.sh 1.2.4
git tag -a v1.2.4 -m "Hotfix 1.2.4"
git push origin v1.2.4

# Merge back to main
git checkout main
git merge hotfix/1.2.4
```

## Rollback

If release has critical issues:

```bash
# Mark release as pre-release on GitHub
# Notify users via Discord/Slack
# Work on hotfix
```
