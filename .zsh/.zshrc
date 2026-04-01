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
    print -Pn '\e]2;%n@%m\a'
}

### NAVIGATION
setopt auto_pushd
setopt pushd_ignore_dups

function chpwd {
    if [[ $PWD != $HOME ]]; then
        timeout 0.1 ls -v --group-directories-first --color=auto 2>/dev/null
    fi
}

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

### PLUGIN
source $HOME/.zsh/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/plugin/zsh-autosuggestions/zsh-autosuggestions.zsh

if command -v fzf >/dev/null; then
    FZF_CTRL_T_OPTS=--walker=file,dir
    FZF_ALT_C_OPTS=--walker=dir
    source $HOME/.zsh/plugin/zsh-fzf/key-bindings.zsh
    source $HOME/.zsh/plugin/zsh-fzf/completion.zsh
fi

### ALIAS
source $HOME/.aliases
