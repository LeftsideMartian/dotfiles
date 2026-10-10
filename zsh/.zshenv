# ~/.zshenv

# ==================================
# Environment Exports
# ==================================

# XDG Base Directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# ZSH
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Starship
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship.toml"

# ==================================
# Pager
# ==================================

# Use bat (or batcat) to display MAN pages
if command -v bat >/dev/null 2>&1; then
  export MANPAGER="bat -l man -p"
elif command -v batcat >/dev/null 2>&1; then
  export MANPAGER="batcat -l man -p"
fi

# ==================================
# Other config
# ==================================

## Editor
export EDITOR="vim"
export VISUAL="$EDITOR"

## GPG
# MATT NOTE Double chcek this
# Something about SSH GPG keys I think
export GPG_TTY=$(tty)

## PATH
# Personal binaries/scripts
export PATH="$HOME/.local/bin:$PATH"
