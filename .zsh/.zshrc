### HISTORY
HISTFILE=${ZDOTDIR:-$HOME}/.zhistory
SAVEHIST=10000
HISTSIZE=10000
setopt extended_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space

### PROMPT
PROMPT=
PROMPT+='%(!.%F{red}.%F{blue})%B%n%b%f@%m '
PROMPT+='%40<...<%B%~%b%<< '
PROMPT+='%(?..%F{red})%(!.#.$)%f '

function precmd {
    print -Pn '\e]133;A\e\\'
    print -Pn '\e]2;%n@%m\a'
}

### NAVIGATION
setopt auto_pushd
setopt pushd_ignore_dups

### COMPLETION
fpath=($fpath $HOME/.zsh/plugin/zsh-completions/src)
autoload -Uz compinit && compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

### EDITING
bindkey -e

bindkey '^[[Z' reverse-menu-complete

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^P' up-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

### ALIAS
alias mv="mv -i"
alias cp="cp -i"

alias lc="ls -C -v --group-directories-first"
alias ll="lc -l -h"
alias la="ll -A"

alias dotfiles='git --git-dir="$HOME/.local/share/dotfiles" --work-tree="$HOME"'

### PLUGIN
source $HOME/.zsh/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/plugin/zsh-autosuggestions/zsh-autosuggestions.zsh

if command -v fzf >/dev/null; then
    FZF_CTRL_T_OPTS=--walker=file,dir
    FZF_ALT_C_OPTS=--walker=dir
    source $HOME/.zsh/plugin/zsh-fzf/key-bindings.zsh
    source $HOME/.zsh/plugin/zsh-fzf/completion.zsh
fi

