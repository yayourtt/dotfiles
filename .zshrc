# Oh My Zsh
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
