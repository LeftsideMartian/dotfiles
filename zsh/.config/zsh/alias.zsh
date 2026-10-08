# ~/.config/zsh/alias.zsh

# =========================================================
# Modern CLI Replacements
# =========================================================

# Better ls
alias ls='eza --icons auto'

# Detailed listing
alias ll='eza -lh --icons --git'

# Detailed listing including hidden files
alias la='eza -lah --icons auto --git'

# Tree view
alias tree='eza --tree --icons auto'

# Reuse ls completions for eza (avoids defining a separate completion function)
compdef eza=ls

# Better cat
alias cat='bat'

# =========================================================
# Core utilities
# =========================================================

alias grep='rg --color=auto'
alias diff='diff --color=auto'
alias df='df -h'

# =========================================================
# Custom
# =========================================================

# Configs
alias zshrc="$EDITOR $ZDOTDIR/.zshrc"
alias szsh="source $ZDOTDIR/.zshrc"
alias zshenv="$EDITOR $HOME/.zshenv"
alias ghostconf="$EDITOR $XDG_CONFIG_HOME/ghostty/config.ghostty"

# Copy shortcuts
alias cpy="pbcopy <" #MacOS

alias vsc="code ."
