#!/usr/bin/env bash
set -euo pipefail

# TODO: make indempotent and detect already installed libraries
# TODO: find a good font to install for default

# NOTE: this script assumes x86-64 architecture
# TODO: verify architecture

TARGET_DIR="$HOME/workspace"
FONTS_DIR="$HOME/.local/share/fonts"
GOPATH="$HOME/go"

# TODO: verify user has sudo permissions

### Install Dev Packages

# Starship
echo "Installing starship..."
curl -sS https://starship.rs/install.sh | sh
echo ""

# Tmux
echo "Installing tmux..."
sudo apt install tmux -y
echo ""

# Direnv
echo "Installing direnv..."
sudo apt install direnv -y
echo ""

# btop
echo "Installing btop..."
sudo apt install btop -y
echo ""

# tree
echo "Installing tree..."
sudo apt install tree -y
echo ""

# Tailscale
echo "Installing tailscale..."
curl -fsSL https://tailscale.com/install.sh | sh
echo ""

# LazyGit - per their GitHub (https://github.com/jesseduffield/lazygit#installation)
echo "Installing lazygit..."
# TODO: check if apt has it first
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
LAZYGIT_ARCH=$(uname -m | sed -e 's/aarch64/arm64/')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_${LAZYGIT_ARCH}.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
echo ""

# FastFetch
echo "Installing fastfetch..."
# TODO: check if apt has it first
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch && sudo apt update
sudo apt install fastfetch -y
echo ""

# UV
echo "Installing uv..."
curl -LsSf https://astral.sh/uv/install.sh | sh
echo ""

# Go
echo "Installing golang..."
sudo rm -rf /usr/local/go 
sudo tar -C /usr/local -xzf go1.27.3.linux-amd64.tar.gz
echo ""

# Golangci-lint
echo "Installing golangci-lint..."
curl -sSfL https://golangci-lint.run/install.sh | sh -s -- -b $(go env GOPATH)/bin v2.15.0
echo ""

# Lefthook
echo "Installing lefthook..."
go install github.com/evilmartians/lefthook/v2@v2.2.2
echo ""

# Yamllint
echo "Installing yamllint..."
sudo apt install yamllint -y
echo ""

# Task
echo "Installing task..."
curl -1sLf 'https://dl.cloudsmith.io/public/task/task/setup.deb.sh' | sudo -E bash
sudo apt install task -y
echo ""

# Parsing
echo "Installing parsing libs..."
sudo apt install jq yq -y
echo ""

# Misc. Dev Tools
sudo apt install ripgrep fzf -y

# Kubernetes CLI
echo "Installing kubernetes-cli..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# TODO: add binary verification from install page (https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
echo ""

# Sops
echo "Installing sops..."
go install github.com/getsops/sops/v3/cmd/sops@latest
echo ""

# Age
echo "Installing age..."
sudo apt install age -y
echo ""

# k9s
echo "Installing k9s..."
wget https://github.com/derailed/k9s/releases/latest/download/k9s_linux_amd64.deb && sudo apt install ./k9s_linux_amd64.deb && rm k9s_linux_amd64.deb
echo ""

# OpenTofu (https://opentofu.org/docs/intro/install/deb/)
echo "Installing opentofu..."
curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh
chmod +x install-opentofu.sh
./install-opentofu.sh --install-method deb
rm -f install-opentofu.sh
echo ""

# Terragrunt (https://docs.terragrunt.com/getting-started/install/)
echo "Installing terragrunt..."
curl -sSfL --proto '=https' --tlsv1.2 https://terragrunt.com/install | bash
echo ""

# Cloudflared
echo "Installing cloudflared..."
sudo mkdir -p --mode=0755 /usr/share/keyrings
curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | sudo tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null
echo 'deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared any main' | sudo tee /etc/apt/sources.list.d/cloudflared.list
sudo apt-get update && sudo apt-get install cloudflared
apt-cache policy cloudflared
echo ""

# Prek
echo "Installing prek..."
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/j178/prek/releases/download/v0.5.3/prek-installer.sh | sh
echo ""

# Helix
echo "Installing helix..."
sudo add-apt-repository ppa:maveonair/helix-editor && sudo apt update
sudo apt install helix -y
echo ""

# Filetree (Yazi)
echo "Installing filetree (yazi)..."
curl -fsSL https://yazi-rs.github.io/builds/yazi-keyring.gpg | sudo tee /usr/share/keyrings/yazi-keyring.gpg >/dev/null
echo 'deb [signed-by=/usr/share/keyrings/yazi-keyring.gpg] https://yazi-rs.github.io/builds/ stable main' | sudo tee /etc/apt/sources.list.d/yazi.list >/dev/null
sudo apt update && sudo apt install yazi
echo ""

# Install npm
echo "Installing npm..."
sudo apt install npm -y
echo ""

# Install language servers
echo "Installing language servers for helix..."
sudo apt install python3-pylsp shellcheck shfmt -y
sudo npm install -g yaml-language-server vscode-langservers-extracted bash-language-server @taplo/cli
go install golang.org/x/tools/gopls@latest
echo ""

# Git
echo "Setting up git..."
# TODO: install git if needed
git config --global user.name "Andrew Chaney"
git config --global user.email "andrewchaney24@gmail.com"
echo ""

# Workspace Setup
echo "Setting up workspace..."
mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR"
git clone git@github.com:andrew-chaney/dotfiles
git clone git@github.com:andrew-chaney/masters-program
git clone git@github.com:andrew-chaney/homelab
echo ""

# Wire Configurations
echo "Wiring configurations..."
mkdir -p $HOME/.config
ln -sf $HOME/workspace/dotfiles/bash/bashrc $HOME/.bashrc
ln -sf $HOME/workspace/dotfile/base/inputrc $HOME/.inputrc
ln -sf $HOME/workspace/dotfiles/tmux/tmux.conf $HOME/.tmux.conf
ln -sf $HOME/workspace/dotfiles/starship/starship.toml $HOME/.config/starship.toml
ln -sf $HOME/workspace/dotfiles/helix $HOME/.config/helix
source $HOME/.bashrc
echo ""
