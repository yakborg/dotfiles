#!/usr/bin/env zsh
set -e

DOTFILES="$HOME/dotfiles"
HOME_DIR="$DOTFILES/home"

# パッケージインストール
source "$DOTFILES/scripts/install-packages.sh"

echo "🔗 Creating symlinks..."

# .config ディレクトリの確保
mkdir -p "$HOME/.config/mise"
mkdir -p "$HOME/.config/sheldon"

# シンボリックリンク作成
ln -sf "$HOME_DIR/.zshrc"                        "$HOME/.zshrc"
ln -sf "$HOME_DIR/.zshenv"                       "$HOME/.zshenv"
ln -sf "$HOME_DIR/.config/mise/config.toml"      "$HOME/.config/mise/config.toml"
ln -sf "$HOME_DIR/.config/sheldon/plugins.toml"  "$HOME/.config/sheldon/plugins.toml"

echo "✅ Done!"
