#!/bin/bash

echo ">>> Initializing..."

KITTY_DIR="$HOME/.config/kitty"
ZSH_CUSTOM_DIR="$HOME/.oh-my-zsh/custom"
ZSH_THEMES_DIR="$HOME/.oh-my-zsh/themes"
VSCODE_DIR="$HOME/.config/Code/User"

mkdir -p "$KITTY_DIR"
mkdir -p "$ZSH_CUSTOM_DIR"
mkdir -p "$ZSH_THEMES_DIR"
mkdir -p "$VSCODE_DIR"

echo "📦 Setting kitty..."
cp kitty/kitty.conf "$KITTY_DIR/"
cp kitty/colors.conf "$KITTY_DIR/"

echo "📦 Setting oh-my-zsh..."
cp oh-my-zsh/aliases.zsh "$ZSH_CUSTOM_DIR/"
cp oh-my-zsh/peaceful.zsh-theme "$ZSH_THEMES_DIR/"

echo "📦 Setting vscode..."
cp vscode/settings.json "$VSCODE_DIR/"

echo "🧩 Install extensions of vscode..."
while IFS= read -r extension; do
    if [ -n "$extension" ]; then
        code --install-extension "$extension"
    fi
done <vscode/extensions

echo "Finish!"
