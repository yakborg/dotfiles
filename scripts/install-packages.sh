#!/usr/bin/env zsh
set -e

echo "📦 Installing apt packages..."
sudo apt update

APT_PACKAGES=(
  git
  curl
  unzip
  bubblewrap
  build-essential
  zsh
)

sudo apt install -y $APT_PACKAGES
echo "✅ apt packages done!"
