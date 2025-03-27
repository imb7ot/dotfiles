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
setopt prompt_subst
PROMPT=
PROMPT+='%(!.%F{red}.%F{blue})%B%n%b%f@%m '
PROMPT+='${CONTAINER_ID:+($CONTAINER_ID) }'
PROMPT+='%40<...<%B%~%b%<< '
PROMPT+='%(?..%F{red}%?%f )'
PROMPT+='%(!.#.$) '

### title
precmd() { print -Pn -- '\e]2;%n@%m\a' }

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

### alias
alias dotfiles='git -C "$HOME" --git-dir="$HOME/.local/share/dotfiles" --work-tree=.'

alias bc='bc -q'
alias ed='ed -p:'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'

alias lc='ls --group-directories-first'
alias ll='lc -hl'
alias la='ll -A'

### plugin
source $HOME/.zsh/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/plugin/zsh-autosuggestions/zsh-autosuggestions.zsh
