# 🚀 Getting Started - CICD Pipeline Demo

## 📋 Quick Start Checklist

### 1. ✅ Repository Setup
```bash
# Initialize git repository
git init
git add .
git commit -m "Initial CICD pipeline setup"

# Create GitHub repository và push
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/cicd-demo.git
git push -u origin main
```

### 2. ✅ Telegram Bot Configuration

#### Create Telegram Bot:
1. Message [@BotFather](https://t.me/botfather) on Telegram
2. Send `/newbot`
3. Follow prompts to create your bot
4. **Save the Bot Token** (format: `123456789:ABCdefGhIJKlmNoPQRsTUVwxyZ`)

#### Get Chat ID:
```bash
# Method 1: Direct message
1. Start a chat với bot của bạn
2. Send any message
3. Visit: https://api.telegram.org/bot<BOT_TOKEN>/getUpdates
4. Find "chat":{"id":CHAT_ID} in response

# Method 2: Group/Channel
1. Add bot to group/channel
2. Send a message tagging the bot
3. Use same URL to get updates
4. Look for chat ID in response
```

### 3. ✅ GitHub Secrets Setup

Go to: **Repository Settings** → **Secrets and variables** → **Actions**

Add these secrets:
- **`TELEGRAM_BOT_TOKEN`**: Your bot token từ BotFather
- **`TELEGRAM_CHAT_ID`**: Your chat ID (có thể là âm cho groups)

### 4. ✅ Local Testing

#### Test Application:
```bash
# Install dependencies
npm install

# Run locally
npm start
# Access: http://localhost:3000

# Or use demo script
./demo-scripts.sh local
```

#### Test Docker:
```bash
# Build and run Docker container
docker build -t cicd-demo .
docker run -p 3000:3000 cicd-demo

# Or use demo script  
./demo-scripts.sh docker
```

#### Test Docker Compose:
```bash
# Run với Nginx reverse proxy
docker-compose up --build

# Or use demo script
./demo-scripts.sh compose
```

## 🧪 Demo Scenarios

### ✅ Success Demo
```bash
# Test clean code (no secrets)
./demo-scripts.sh gitleaks-ok

# Push to GitHub
git add .
git commit -m "Clean code commit"
git push origin main
# → Pipeline sẽ chạy thành công và gửi Telegram notification
```

### ❌ Failure Demo  
```bash
# Test với secrets trong code
./demo-scripts.sh gitleaks-fail

# Commit file có secrets để demo failure
git add demo-secrets.txt
git commit -m "Demo: commit with secrets"  
git push origin main
# → Pipeline sẽ fail và gửi security alert qua Telegram
```

## 📊 Monitoring Pipeline

### GitHub Actions:
- Go to **Actions** tab trong GitHub repo
- Monitor workflow runs
- View logs và details
- Check job status và timing

### Telegram Notifications:
Bạn sẽ nhận được notifications cho:
- ✅ **Success**: Pipeline completed successfully  
- ❌ **Security Alert**: Gitleaks found secrets
- ❌ **Build Failure**: Tests hoặc build failed
- ❌ **Docker Failure**: Image build/push failed
- ❌ **Deploy Failure**: Deployment failed

## 🛠️ Troubleshooting

### Common Issues:

#### 1. Telegram notifications not working
```bash
# Check secrets in GitHub repo settings
# Verify bot token và chat ID
# Test bot manually:
curl -X POST "https://api.telegram.org/bot<BOT_TOKEN>/sendMessage" \
     -H "Content-Type: application/json" \
     -d '{"chat_id":"<CHAT_ID>","text":"Test message"}'
```

#### 2. Docker build failing
```bash
# Check Dockerfile syntax
# Verify base image availability  
# Test local build:
docker build -t test .
```

#### 3. Gitleaks not detecting secrets
```bash
# Install Gitleaks locally để test:
brew install gitleaks  # macOS
# hoặc download từ GitHub releases

# Run manual scan:
gitleaks detect --source . --verbose
```

#### 4. GitHub Actions workflow not triggering
```bash
# Check workflow syntax:
# - Indentation phải đúng (spaces, not tabs)
# - YAML syntax valid
# - File location: .github/workflows/cicd.yml
```

## 📈 Next Steps

### Production Deployment:
1. **Replace deployment simulation** với real deployment
2. **Add staging environment** để test trước production
3. **Configure real server** hoặc cloud platform
4. **Setup monitoring** với health checks
5. **Add database migrations** nếu cần

### Security Enhancements:
1. **Add OWASP dependency check**
2. **Container vulnerability scanning**
3. **Code quality gates** (SonarQube)
4. **Signed commits** verification
5. **Branch protection rules**

### Scalability:
1. **Kubernetes deployment**
2. **Infrastructure as Code** (Terraform)
3. **GitOps workflow** (ArgoCD)  
4. **Auto-scaling configuration**
5. **Multi-environment support**

## 📚 Learning Resources

### CI/CD Concepts:
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Docker Best Practices](https://docs.docker.com/develop/dev-best-practices/)
- [DevOps Roadmap](https://roadmap.sh/devops)

### Security:
- [OWASP Security Guidelines](https://owasp.org/)
- [Gitleaks Documentation](https://github.com/gitleaks/gitleaks)
- [Container Security](https://cloud.google.com/container-optimized-os/docs/concepts/security)

## 🎯 Success Criteria Checklist

- ✅ Pipeline hoạt động theo đúng yêu cầu
- ✅ Có alert tới Telegram channel  
- ✅ Có tích hợp Gitleaks SAST
- ✅ Demo build thành công
- ✅ Demo build thất bại khi Gitleaks tìm thấy secret
- ✅ Webapp đơn giản thể hiện sự thay đổi sau deploy
- ✅ Slide trình bày kết quả thực hiện

## 🎉 Congratulations!

Bạn đã successfully implement một complete CI/CD pipeline với:
- **Automated security scanning**
- **Containerized deployment** 
- **Real-time monitoring**
- **Production-ready practices**

🚀 **Your DevOps journey starts here!**
