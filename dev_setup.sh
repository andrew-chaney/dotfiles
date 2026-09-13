#!/usr/bin/env bash
set -e

DAILY_DRIVE=false
TARGET_DIR="~/workspace"
GH_TARGET="andrew-chaney"

### Ask for GitHub PAT
read -sp "Enter your GitHub Personal Access Token (PAT) for $GH_TARGET: " GH_TOKEN
echo -e "\n"

if [ -z "$GH_TOKEN" ]; then
  echo "Error: Token cannot be empty. Exiting
  exit 1
fi

### Setup Homebrew
if ! command -v brew &> /dev/null; then
  echo "Homebrew isn't installed, installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

### Intall dev packages

# Starship
brew install starship

# Tmux
brew install tmux

# Neovim
brew tap benjiwolff/neovim-nightly
brew install neovim-nightly

# LazyGit
brew install lazygit

# FastFetch
brew install fastfetch

# UV
brew install uv

# Response Parsing
brew install jq
brew install yq

# Kubernetes
brew install kubernetes-cli
brew install sops
brew install age
brew install k9s

# OpenTofu
brew install opentofu

### Git Setup
if ! command -v git &> /dev/null; then
  brew install git
fi

brew install gh

echo "$GH_TOKEN" | gh auth login --with-token
gh auth setup-git

### Workspace setup
mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR"
git clone dotfiles
git clone composer
git clone prototypes

if $DAILY_DRIVER; then
  git clone masters-program
fi

cd -

### Tailscale Setup
if $DAILY_DRIVER; then
  brew install tailscale
  sudo brew services start tailscale
  sudo tailscale up --ssh
  echo "Tailscale is installed and started on this machine, though you may need to further configure in your machine's settings to allow for inbound remote connections"
fi

### Mosh Setup
if $DAILY_DRIVER; then
  brew install mosh
  echo "Mosh is installed and started on this machine, though you may need to further configure in your machine's settings to allow for inbound remote connections"
fi

### Wire Configurations
mkdir -p ~/.config
ln -s ~/workspace/dotfiles/bash/bashrc ~/.bashrc
ln -s ~/workspace/dotfile/base/inputrc ~/.inputrc
ln -s ~/workspace/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/workspace/dotfiles/starship/starship.toml ~/.config/starship.toml
ln -s ~/workspace/dotfile/nvim ~/.config/nvim

