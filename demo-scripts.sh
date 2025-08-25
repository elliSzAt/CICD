#!/bin/bash

# ============================================
# CICD Pipeline Demo Scripts
# ============================================

set -e  # Exit on error

echo "🚀 CICD Pipeline Demo Setup"
echo "=================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

# ============================================
# Demo Functions
# ============================================

demo_local_app() {
    echo ""
    echo "🏠 Demo 1: Local Application"
    echo "----------------------------"

    print_info "Installing dependencies..."
    npm install

    print_info "Starting application on port 3000..."
    echo "Access at: http://localhost:3000"
    echo "Health check: http://localhost:3000/health"
    echo "API info: http://localhost:3000/api/info"
    echo ""
    echo "Press Ctrl+C to stop the server"
    npm start
}

demo_docker_build() {
    echo ""
    echo "🐳 Demo 2: Docker Build & Run"
    echo "------------------------------"

    print_info "Building Docker image..."
    docker build -t cicd-demo:latest .

    print_status "Docker image built successfully!"

    print_info "Running Docker container..."
    echo "Access at: http://localhost:3001"
    docker run -p 3001:3000 --rm --name cicd-demo-container cicd-demo:latest
}

demo_docker_compose() {
    echo ""
    echo "🐙 Demo 3: Docker Compose (with Nginx)"
    echo "---------------------------------------"

    print_info "Starting services with docker-compose..."
    docker-compose up --build
}

demo_gitleaks_success() {
    echo ""
    echo "🔐 Demo 4: Gitleaks Success (Clean Code)"
    echo "----------------------------------------"

    # Make sure demo-secrets.txt is not committed
    if [ -f "demo-secrets.txt" ]; then
        print_warning "Moving demo-secrets.txt to .gitignore"
        echo "demo-secrets.txt" >> .gitignore
        git rm --cached demo-secrets.txt 2>/dev/null || true
    fi

    print_info "Running Gitleaks scan on clean codebase..."

    if command -v gitleaks &> /dev/null; then
        gitleaks detect --source . --verbose
        print_status "Gitleaks scan completed - No secrets found!"
    else
        print_warning "Gitleaks not installed. Install with:"
        echo "  brew install gitleaks  # macOS"
        echo "  # or download from: https://github.com/gitleaks/gitleaks/releases"
    fi
}

demo_gitleaks_failure() {
    echo ""
    echo "🚨 Demo 5: Gitleaks Failure (Secrets Detected)"
    echo "------------------------------------------------"

    print_warning "This demo will simulate secrets in code"
    print_info "Adding demo-secrets.txt to simulate hardcoded secrets..."

    # Ensure the secrets file exists
    if [ ! -f "demo-secrets.txt" ]; then
        print_error "demo-secrets.txt not found! Creating it..."
        cat > demo-secrets.txt << 'EOF'
# Demo secrets that will be caught by Gitleaks
OPENAI_API_KEY=sk-1234567890abcdef1234567890abcdef
AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
JWT_SECRET=super-secret-jwt-key-that-should-not-be-hardcoded
EOF
    fi

    if command -v gitleaks &> /dev/null; then
        print_info "Running Gitleaks scan..."

        # This should fail and detect secrets
        if gitleaks detect --source . --verbose; then
            print_warning "No secrets detected (unexpected)"
        else
            print_error "Gitleaks detected secrets! (This is expected for the demo)"
            print_info "This is how the pipeline would fail in GitHub Actions"
        fi
    else
        print_warning "Gitleaks not installed. Install with:"
        echo "  brew install gitleaks  # macOS"
        echo "  # or download from: https://github.com/gitleaks/gitleaks/releases"
    fi

    print_warning "Remember to remove demo-secrets.txt before committing to prevent pipeline failure!"
}

demo_github_setup() {
    echo ""
    echo "🐙 Demo 6: GitHub Setup Guide"
    echo "------------------------------"

    print_info "GitHub Repository Setup:"
    echo "1. Create new repository on GitHub"
    echo "2. Clone or initialize repo:"
    echo "   git init"
    echo "   git add ."
    echo "   git commit -m 'Initial commit'"
    echo "   git branch -M main"
    echo "   git remote add origin https://github.com/your-username/cicd-demo.git"
    echo "   git push -u origin main"
    echo ""

    print_info "GitHub Secrets Setup:"
    echo "Go to: Settings → Secrets and variables → Actions"
    echo "Add these secrets:"
    echo "- TELEGRAM_BOT_TOKEN: Get from @BotFather on Telegram"
    echo "- TELEGRAM_CHAT_ID: Your chat/channel ID"
    echo ""

    print_info "Getting Telegram Bot Token:"
    echo "1. Message @BotFather on Telegram"
    echo "2. Send /newbot"
    echo "3. Follow instructions to create bot"
    echo "4. Save the token"
    echo ""

    print_info "Getting Chat ID:"
    echo "1. Add bot to your channel/group or chat directly"
    echo "2. Send a message to the bot"
    echo "3. Visit: https://api.telegram.org/bot<BOT_TOKEN>/getUpdates"
    echo "4. Find \"chat\":{\"id\":CHAT_ID} in the response"
}

show_help() {
    echo ""
    echo "🎯 Available Demo Commands:"
    echo "=========================="
    echo "  $0 local          - Run app locally (Node.js)"
    echo "  $0 docker         - Build and run Docker container"
    echo "  $0 compose        - Run with Docker Compose + Nginx"
    echo "  $0 gitleaks-ok    - Demo Gitleaks success (no secrets)"
    echo "  $0 gitleaks-fail  - Demo Gitleaks failure (secrets found)"
    echo "  $0 github-setup   - Show GitHub setup instructions"
    echo "  $0 all            - Run all demos (except gitleaks-fail)"
    echo ""
    echo "💡 Quick Start:"
    echo "  1. Run: $0 github-setup"
    echo "  2. Setup GitHub repo and secrets"
    echo "  3. Test locally: $0 local"
    echo "  4. Test Docker: $0 docker"
    echo "  5. Push to GitHub to trigger pipeline"
}

# ============================================
# Main Script Logic
# ============================================

case "${1:-help}" in
    "local")
        demo_local_app
        ;;
    "docker")
        demo_docker_build
        ;;
    "compose")
        demo_docker_compose
        ;;
    "gitleaks-ok")
        demo_gitleaks_success
        ;;
    "gitleaks-fail")
        demo_gitleaks_failure
        ;;
    "github-setup")
        demo_github_setup
        ;;
    "all")
        demo_gitleaks_success
        demo_local_app &
        APP_PID=$!
        sleep 5
        kill $APP_PID 2>/dev/null || true
        demo_docker_build &
        DOCKER_PID=$!
        sleep 5
        docker stop cicd-demo-container 2>/dev/null || true
        demo_github_setup
        ;;
    "help"|*)
        show_help
        ;;
esac
