setopt share_history
setopt extended_history

setopt hist_ignore_space

setopt auto_pushd
setopt pushd_ignore_dups

PROMPT=$'%n@%m %~ %(?..%F{red})%(!.#.$)%f '
HISTFILE=$HOME/.zhistory
SAVEHIST=10000
HISTSIZE=10000
ZLE_SPACE_SUFFIX_CHARS=$'&|'

bindkey -e
autoload -U compinit && compinit

alias dotfiles='git --git-dir="${XDG_DATA_HOME:-$HOME/.local/share}/dotfiles" --work-tree="$HOME"'
alias sudo='sudo '
alias xargs='xargs '
alias lc='ls -F --group-directories-first'
alias ll='lc -hl'
alias la='ll -A'
alias bc='bc -q'
alias ed='ed -p:'

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
ZSH_HIGHLIGHT_STYLES[command]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[alias]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[function]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=green'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=green'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=green'
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
