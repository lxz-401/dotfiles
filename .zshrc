# Powerlevel10k Instant Prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ZSH + Oh My Zsh Configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
# ENABLE_CORRECTION="false"

zstyle ':omz:update' mode auto
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'


# Plugins
plugins=(
  git
  z
  history
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# .NET Development Environment
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$DOTNET_ROOT:$PATH
export PATH=$PATH:$HOME/.dotnet/tools

export NUGET_PACKAGES=$HOME/.nuget/packages
export NUGET_HTTP_CACHE_PATH=$HOME/.local/share/NuGet/http-cache

ulimit -n 8192

# Editor Tools
export PATH=$PATH:/opt/nvim-linux-x86_64/bin # nvim 0.11.6
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"
export EDITOR=vim
export VISUAL=vim

# File Navigation + Terminal Utilities
unalias ls 2>/dev/null

alias ls='eza -a --icons'
alias ll='eza -lah --icons'
alias la='eza -a --icons'
alias lt='eza --tree --icons'
alias lg='eza -lah --git --icons'

alias storage='cd /mnt/Storage || { echo "Directory not found"; }'
alias codebase='cd /mnt/Storage/Codebase || { echo "Directory not found"; }'
alias books='cd /mnt/Storage/Books || { echo "Directory not found"; }'

alias c='clear'

alias f='fzf --preview "bat --style=numbers --color=always {}"'

# System Control
alias sys='\fastfetch'
alias t='tmux'
alias p='poweroff'
alias qa='exit'
alias res='sudo reboot'
alias top='btop'
alias journalctl='lazyjournal'
alias calc='qalc'
alias lock='loginctl lock-session'
alias desk='cd ~/Desktop'
alias dw='cd ~/Downloads'
alias ping='gping'
alias ip='hostname -I'
alias emacs="emacs -nw"

# Cleanup Shortcuts
alias ct='rm -rf ~/.local/share/Trash/*'
alias cdl='rm -rf ~/Downloads/*'

# .NET Shortcuts
alias di='/mnt/Storage/Scripts/dotnet/dotnet-info.sh'
alias dnr='dotnet run'
alias dnb='dotnet build'
alias dnt='dotnet test'
alias dnf='dotnet format'
alias dnrst='dotnet restore'
alias dnc='dotnet clean'
alias dnew='dotnet new'
alias dnw='dotnet watch'
alias dncrb='dnc && dnrst && dnb'

alias efadd='dotnet ef migrations add'
alias efremove='dotnet ef migrations remove'
alias efupdate='dotnet ef database update'
alias eflist='dotnet ef migrations list'

# Python Shortcuts
alias py='python3'

# JavaScript Shortcuts
alias nrun='npm run dev'
alias ntest='npm run test'
alias nbuild='npm run build'
alias nformat='npm run format'
alias nlint='npm run lint'

# pgcli
alias pg='pgcli -U postgres'

# ZSH
alias uzsh='source ~/.config/zsh/.zshrc'
alias ozsh='nvim ~/.config/zsh/.zshrc'

# Productivity Tools
eval "$(zoxide init zsh)"

# Node Version Manager
export NVM_DIR="$HOME/.nvm"

# Go
export PATH="$PATH:$(go env GOPATH)/bin"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

unsetopt correct
unsetopt correct_all

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

