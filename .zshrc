# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Starship handles the prompt
ZSH_THEME=""

plugins=(
    git
    docker
    sudo
)

source "$ZSH/oh-my-zsh.sh"

# PATH
export PATH="$HOME/.local/bin:$PATH"

# Better Zsh experience
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases
alias ls="eza --icons"
alias ll="eza -lah --icons"
alias cat="bat"
alias c="clear"
alias lg="lazygit"
alias ff="fastfetch"

alias la="ls -A"
alias ..="cd .."
alias ...="cd ../.."

alias gs="git status"
alias gc="git commit"
alias gp="git push"

# System info when opening a terminal
if [[ -o interactive ]] && command -v fastfetch >/dev/null 2>&1; then
    fastfetch
fi

# Prompt
eval "$(starship init zsh)"# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""  # disabled, prompt is handled by Starship
plugins=(git)
source "$ZSH/oh-my-zsh.sh"

# PATH
export PATH="$HOME/.local/bin:$PATH"

# Prompt
eval "$(starship init zsh)"

# Aliases
alias ll='ls -lah'
alias la='ls -A'
alias ..='cd ..'
alias ...='cd ../..'
alias gs='git status'
alias gc='git commit'
alias gp='git push'
