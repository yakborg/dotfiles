#!/usr/bin/env zsh
set -e

echo "📦 Installing apt packages..."
sudo apt update

APT_PACKAGES=(
  git
  gh
  curl
  unzip
  build-essential
  tmux
  vim
  zsh
)

sudo apt install -y $APT_PACKAGES
echo "✅ apt packages done!"
