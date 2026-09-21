#!/usr/bin/env bash
# ==============================================================================
# Dotfiles Installation & Symlinking Script
# Author: lxz-404
# Repository: https://github.com/lxz-401/dotfiles
# ==============================================================================

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

echo "==> Setting up dotfiles from: $DOTFILES_DIR"

# Function to safely create symlinks with backup
link_file() {
    local src="$1"
    local dest="$2"

    if [ -L "$dest" ]; then
        rm "$dest"
    elif [ -e "$dest" ]; then
        mkdir -p "$BACKUP_DIR"
        echo "    Backing up existing $dest to $BACKUP_DIR"
        mv "$dest" "$BACKUP_DIR/"
    fi

    mkdir -p "$(dirname "$dest")"
    ln -s "$src" "$dest"
    echo "  ✓ Linked $dest -> $src"
}

# Base dotfiles
link_file "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
link_file "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
link_file "$DOTFILES_DIR/.p10k.zsh" "$HOME/.p10k.zsh"
link_file "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
link_file "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"

# .config applications
link_file "$DOTFILES_DIR/.config/alacritty" "$HOME/.config/alacritty"
link_file "$DOTFILES_DIR/.config/fastfetch" "$HOME/.config/fastfetch"
link_file "$DOTFILES_DIR/.config/lazygit" "$HOME/.config/lazygit"
link_file "$DOTFILES_DIR/.config/gtk-3.0" "$HOME/.config/gtk-3.0"
link_file "$DOTFILES_DIR/.config/gnome-wallpaper-switcher" "$HOME/.config/gnome-wallpaper-switcher"
link_file "$DOTFILES_DIR/.config/gnome-left-sidebar" "$HOME/.config/gnome-left-sidebar"
link_file "$DOTFILES_DIR/.config/htop" "$HOME/.config/htop"
link_file "$DOTFILES_DIR/.config/mousiki" "$HOME/.config/mousiki"
link_file "$DOTFILES_DIR/.config/yt-dlp" "$HOME/.config/yt-dlp"

# Neovim (NitroVim submodule)
if [ -d "$DOTFILES_DIR/.config/nvim" ]; then
    link_file "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"
fi

# Wallpapers
link_file "$DOTFILES_DIR/wallpapers" "$HOME/Pictures/Wallpapers"

# Initialize submodules if needed
if [ -f "$DOTFILES_DIR/.gitmodules" ]; then
    echo "==> Updating git submodules..."
    git -C "$DOTFILES_DIR" submodule update --init --recursive
fi

echo ""
echo "✨ Dotfiles installation completed successfully!"
