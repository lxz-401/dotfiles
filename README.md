# ⚡ lxz-401's Dotfiles

Personal Linux configuration files, scripts, and high-resolution wallpapers tailored for speed, aesthetics, and developer productivity.

---

## 🎨 Overview

- **OS / Distro**: Arch Linux / NitroOS
- **Shell**: [Zsh](https://www.zsh.org/) + [Oh-My-Zsh](https://ohmyz.sh/) with [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- **Terminal**: [Alacritty](https://alacritty.org/) (blur + Buttonless + OneDark / Catppuccin themes)
- **Editor**: [NitroVim](https://github.com/lxz-401/NitroVim) (included as submodule)
- **Multiplexer**: [Tmux](https://github.com/tmux/tmux) with OneDark theme & TPM
- **Fetch**: [Fastfetch](https://github.com/fastfetch-cli/fastfetch) (custom NitroOS configuration)
- **Git TUI**: [Lazygit](https://github.com/jesseduffield/lazygit)
- **Custom Tools**:
  - [gnome-wallpaper-switcher](https://github.com/lxz-401/gnome-wallpaper-switcher)
  - gnome-left-sidebar (custom sidebar & widgets)
- **Wallpapers**: 45+ curated 4K/5K wallpapers (Anime, Dark, Minimalist, Default)

---

## 📂 Repository Structure

```text
dotfiles/
├── .bashrc                         # Minimal bash fallback configuration
├── .zshrc                          # Primary Zsh configuration, aliases & plugins
├── .p10k.zsh                       # Powerlevel10k prompt configuration
├── .tmux.conf                      # Tmux keybindings and OneDark theme
├── .gitconfig                      # Git config template & convenient aliases
├── .config/
│   ├── alacritty/                  # Alacritty terminal settings & themes
│   ├── fastfetch/                  # Fastfetch layout & NitroOS art
│   ├── lazygit/                    # Lazygit configuration
│   ├── gtk-3.0/                    # GTK3 dark theme settings & bookmarks
│   ├── gnome-wallpaper-switcher/   # Wallpaper switcher daemon config
│   ├── gnome-left-sidebar/         # GNOME desktop sidebar widget config
│   ├── htop/                       # Htop system monitor configuration
│   ├── mousiki/                    # Terminal music player configuration
│   ├── yt-dlp/                     # yt-dlp video downloader configuration
│   └── nvim/                       # NitroVim submodule (https://github.com/lxz-401/NitroVim)
├── wallpapers/                     # Curated high-res desktop wallpapers
│   ├── anime/
│   ├── cyber/
│   ├── dark/
│   └── default/
├── install.sh                      # Automated installation & symlink script
└── README.md
```

---

## 🚀 Quick Start

### 1. Clone the repository (with submodules)

```bash
git clone --recurse-submodules https://github.com/lxz-401/dotfiles.git ~/dotfiles
```

### 2. Run the installation script

```bash
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

> **Note**: Existing configuration files will automatically be backed up to `~/.dotfiles_backup/<timestamp>/` before creating symlinks.

---

## 🛠 Recommended Packages

To take full advantage of these dotfiles, install the following packages:

```bash
# Arch Linux / pacman
sudo pacman -S zsh tmux alacritty fastfetch lazygit fzf ripgrep eza bat zoxide mpv
```

### Zsh Plugins:
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

### Tmux TPM:
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
*(Press `Ctrl+a` then `I` inside tmux to install plugins).*

---

## 🔒 Security Note

Confidential application directories (browser caches/cookies, Discord tokens, GitHub CLI credentials, clipboard histories) are deliberately excluded from this repository to ensure privacy and security.
