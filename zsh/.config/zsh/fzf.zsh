# ~/.config/zsh/fzf.zsh

# =========================================================
# fzf | Fuzzy finder
# =========================================================

### Load fzf config from different locations depending on OS

# macOS / Homebrew (Apple Silicon)
if [[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]]; then
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
  source /opt/homebrew/opt/fzf/shell/completion.zsh
fi

# macOS / Homebrew (Intel)
if [[ -f /usr/local/opt/fzf/shell/key-bindings.zsh ]]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

# Arch
if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
fi

# Ubuntu
if [[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
fi

# Local Git-cloned fzf
if [[ -f "$HOME/.fzf/shell/key-bindings.zsh" ]]; then
  source "$HOME/.fzf/shell/key-bindings.zsh"
  source "$HOME/.fzf/shell/completion.zsh"
fi

### Config

# Keybinds
find_files="fd --type f --hidden --strip-cwd-prefix -L"
find_directories="fd --type d --hidden --follow --exclude .git -L"

export FZF_DEFAULT_COMMAND="$find_files"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$find_directories"

# UI
export FZF_DEFAULT_OPTS='
  --height=60%
  --layout=reverse
  --border=rounded
  --preview-window="border-rounded"
  --separator="─"
  --scrollbar="│"
  --prompt=" "
  --pointer="󱞩"
  --gutter=" "

  --color="bg:-1,fg:#FDFFF1"
  --color="bg+:-1,fg+:#FDFFF1,gutter:-1"
  --color="hl:#F92672,hl+:#F92672"
  --color="info:#66D9EF,prompt:#A6E22E"
  --color="pointer:#F92672,marker:#AE81FF"
  --color="spinner:#E6DB74,header:#E6DB74"
  --color="border:#6E7066,separator:#6E7066"
  --color="scrollbar:#6E7066"
'

export _FZF_PREVIEW_CMD='bat --color=always --style=plain,numbers --line-range=:500 {}'
export FZF_CTRL_T_OPTS="--preview '$_FZF_PREVIEW_CMD'"

# Ctrl+F: file picker excluding hidden files
_fzf_file_no_hidden() {
  local cmd result
  cmd="${FZF_DEFAULT_COMMAND/--hidden /}"
  result=$(eval "${cmd:-find . -type f}" | fzf --preview "$_FZF_PREVIEW_CMD") \
    && LBUFFER+="$result"  # LBUFFER is the text left of the cursor
  zle reset-prompt
}
zle -N _fzf_file_no_hidden
