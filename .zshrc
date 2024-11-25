### history
setopt extended_history
setopt share_history
setopt hist_ignore_space
HISTFILE=$HOME/.zsh/history
SAVEHIST=10000
HISTSIZE=10000

### navigation
setopt auto_pushd
setopt pushd_ignore_dups

### prompt
PROMPT=
PROMPT+='%(?..%F{red}%?%f )'
PROMPT+='%(!.%F{red}.%F{blue})%B%n%b%f@%m '
PROMPT+='%40<...<%B%~%b%<< '
PROMPT+='%(!.#.$) '

### zle
bindkey -e
ZLE_SPACE_SUFFIX_CHARS=$'&|'

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^P' up-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search

### completion
autoload -Uz compinit && compinit -d $HOME/.zsh/compdump
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

### other
source $HOME/.zsh/config/alias.zsh
source $HOME/.zsh/config/plugin.zsh
