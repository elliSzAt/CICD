# 🛡️ Branch Protection Setup để Block Push với Secrets

## Mục tiêu
Không cho phép push trực tiếp lên main nếu Gitleaks detect secrets.

## Setup Branch Protection Rules

### Bước 1: Vào GitHub Repository Settings
1. Go to: https://github.com/elliSzAt/CICD/settings/branches
2. Click "Add rule"
3. Branch name pattern: `main`

### Bước 2: Configure Protection Rules
```
✅ Restrict pushes that create files with detected secrets
✅ Require a pull request before merging
   ✅ Require approvals: 1
   ✅ Dismiss stale reviews when new commits are pushed
✅ Require status checks to pass before merging
   ✅ Require branches to be up to date before merging
   ✅ Status checks that are required:
       - Security Scan (Gitleaks)
       - Build & Test
✅ Require conversation resolution before merging
✅ Include administrators
```

## Workflow sau khi setup:

### ❌ Direct Push (BLOCKED):
```bash
git push origin main
# → ERROR: Branch protection rules prevent direct push
```

### ✅ Pull Request Workflow (REQUIRED):
```bash
# Developer workflow:
git checkout -b feature/my-changes
git add .
git commit -m "Add feature"
git push origin feature/my-changes

# Create Pull Request on GitHub
# → GitHub Actions runs Gitleaks on PR
# → If secrets found: PR cannot be merged
# → If clean: PR can be merged to main
```

## Demo Flow:

### Test 1: PR với Secrets (sẽ bị block)
```bash
git checkout -b test/with-secrets
echo 'API_KEY=sk-secret123456789' > test-secret.txt
git add test-secret.txt
git commit -m "Add secrets (should fail)"
git push origin test/with-secrets
# Create PR → Gitleaks fails → Cannot merge
```

### Test 2: PR Clean (sẽ được merge)
```bash
git checkout -b test/clean-code
echo 'API_KEY=${GITHUB_API_KEY}' > config-clean.txt
git add config-clean.txt
git commit -m "Add clean config"
git push origin test/clean-code
# Create PR → All checks pass → Can merge
```

## Kết quả:
- ✅ No direct push to main (forced PR workflow)
- ✅ Gitleaks must pass before merge
- ✅ Secrets are caught BEFORE entering main branch
- ✅ Team collaboration through PRs
- ✅ Code review process enforced
