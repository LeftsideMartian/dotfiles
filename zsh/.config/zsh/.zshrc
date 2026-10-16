# ~/.config/zsh/.zshrc

# =========================================================
# History
# =========================================================

HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY #Append 
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS #Ignore duplicate command caching
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST #Once at max size, expire oldest cache first
setopt HIST_FIND_NO_DUPS

# =========================================================
# Shell behaviour
# =========================================================

setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT  # sort file10 after file9, not after file1
bindkey -e # Disable vi mode for zsh

# =========================================================
# Smart directory navigation
# =========================================================

# Disabling zoxide - renable if you are going to use it
# Initialize zoxide
# eval "$(zoxide init zsh)"

# =========================================================
# Completion
# =========================================================

# Load completion system
autoload -Uz compinit

# Initialize completion with cached metadata file
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

# Enable interactive completion menu selection
zstyle ':completion:*' menu select

# Make completion case-insensitive
# Example: "doc" can complete to "Documents"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # lowercase input matches upper and lower

# =========================================================
# Modular Config Files
# =========================================================

# Load all *.zsh files in $ZDOTDIR
for ZSH_FILE in "${ZDOTDIR:-$HOME}"/*.zsh(N); do
  source "${ZSH_FILE}"
done

# =========================================================
# Path
# =========================================================
export PATH="/opt/homebrew/opt/nano/bin:$PATH"

# =========================================================
# Homebrew
# =========================================================

export HOMEBREW_AUTO_UPDATE_QUIET=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_BAT=1

# =========================================================
# Startup
# =========================================================
fastfetch
