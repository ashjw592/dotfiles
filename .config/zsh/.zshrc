# ~/.zshrc
[[ -n "$ZSH_VERSION" ]] || return

# ── History ───────────────────────────────────
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_IGNORE_ALL_DUPS   # no duplicates
setopt HIST_IGNORE_SPACE      # skip commands starting with a space
setopt HIST_VERIFY            # show expanded history before running
setopt SHARE_HISTORY          # share history across sessions instantly
setopt APPEND_HISTORY         # append rather than overwrite
setopt EXTENDED_HISTORY       # save timestamp + duration

# ── Completion ────────────────────────────────
autoload -Uz compinit && compinit

setopt MENU_COMPLETE           # select first match immediately
setopt AUTO_LIST               # list choices on ambiguous completion
setopt COMPLETE_IN_WORD        # complete from both ends of a word
setopt ALWAYS_TO_END           # move cursor to end after completion

# Case-insensitive, partial-word, and substring matching
zstyle ':completion:*' matcher-list \
  'm:{a-z}={A-Z}' \
  'm:{a-zA-Z}={A-Za-z}' \
  'r:|[._-]=* r:|=*' \
  'l:|=* r:|=*'

# Menu-style selection with colors
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}no matches%f'

# Cache completions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# ── Plugins ───────────────────────────────────
# Install on Fedora:
#   sudo dnf install zsh-autosuggestions zsh-syntax-highlighting

# Fish-style inline suggestions
if [[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_STRATEGY=(history completion)  # history first, then completion
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#626880"   # Catppuccin Frappé surface2
  # Accept suggestion with Ctrl-Space or right arrow
  bindkey '^ ' autosuggest-accept
bindkey -M viins '^ ' autosuggest-accept
  bindkey '^[[C' autosuggest-accept  # right arrow
fi

# Syntax highlighting (must be sourced last among plugins)
if [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
fi

# ── Directory jumping (zoxide) ────────────────
# Install: sudo dnf install zoxide
# Usage: z foo  →  jumps to the most frecent dir matching "foo"
#        zi      →  interactive fuzzy jump
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
  alias cd='z'   # make cd use zoxide automatically
fi

# ── Aliases ───────────────────────────────────

# ls → eza (modern ls with colors, icons, git info)
# Install: sudo dnf install eza
if command -v eza &>/dev/null; then
  alias ls='eza --icons --group-directories-first'
  alias ll='eza --icons --group-directories-first -la --git'
  alias lt='eza --icons --tree --level=2'
else
  alias ls='ls --color=auto'
  alias ll='ls -lah --color=auto'
fi

# Git
alias g='git'
alias gs='git status -sb'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gp='git push'
alias gl='git pull'
alias glog='git log --oneline --graph --decorate'
alias gd='git diff'
alias gds='git diff --staged'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Misc
alias grep='grep --color=auto'
alias mkdir='mkdir -p'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
cat() {
  if command -v bat &>/dev/null; then
    bat --style=plain --paging=never "$@"
  else
    command cat "$@"
  fi
}

# ── Vi mode ───────────────────────────────────
bindkey -v
bindkey -M viins '^i' complete-word
bindkey -M viins '^[[Z' reverse-menu-complete  # shift-tab to go backwards
KEYTIMEOUT=1
bindkey -M vicmd ':' undefined-key   # disable execute-named-cmd

_cursor_block() { echo -ne '\e[2 q'; }
_cursor_beam()  { echo -ne '\e[6 q'; }

zle-keymap-select() {
  if [[ $KEYMAP == vicmd ]]; then
    _cursor_block
  else
    _cursor_beam
  fi
}
zle -N zle-keymap-select

zle-line-init() {
  _cursor_beam
}
zle -N zle-line-init

# ── Keybinds ──────────────────────────────────
# Keep these familiar shortcuts in insert mode
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^w' backward-kill-word
bindkey '^u' kill-whole-line
bindkey '^l' clear-screen

# Up/down searches history by prefix
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# ── Starship ──────────────────────────────────
# Must stay last
eval "$(starship init zsh)"

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Auto-start tmux
if command -v tmux &>/dev/null && [[ -z "$TMUX" ]]; then
  exec tmux
fi

# Aliases
alias editzsh='nvim ~/.config/zsh/.zshrc'
alias editnvim='nvim ~/.config/nvim/'
wallpaper() {
	gsettings set org.gnome.desktop.background picture-uri "file://$1"
	gsettings set org.gnome.desktop.background picture-uri-dark "file://$1"
}
