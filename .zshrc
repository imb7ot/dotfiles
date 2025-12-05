### directory
mkdir -p $HOME/.zsh

### alias
alias dotfiles='git -C "$HOME" --git-dir="$HOME/.local/share/dotfiles" --work-tree=.'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'

alias lc='ls -w 80 --group-directories-first'
alias ll='lc -hl'
alias la='ll -A'

### history
HISTFILE=$HOME/.zsh/history
SAVEHIST=10000
HISTSIZE=10000

setopt extended_history
setopt share_history
setopt hist_ignore_space

### navigation
setopt auto_pushd
setopt pushd_ignore_dups

function chpwd { lc }

### prompt
setopt prompt_subst
PROMPT=
PROMPT+='${CONTAINER_ID:+($CONTAINER_ID) }'
PROMPT+='%(!.%F{red}.%F{blue})%B%n%b%f@%m '
PROMPT+='%40<...<%B%~%b%<< '
PROMPT+='%(?..%F{red})%(!.#.$)%f '

function precmd { print -Pn -- '\e]2;%n@%m\a' }

### editing
bindkey -e

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey '^P' up-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search

### completion
fpath=($fpath $HOME/.zsh/plugin/zsh-completions/src)

autoload -U compinit && compinit -d $HOME/.zsh/compdump
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

### plugin
source $HOME/.zsh/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/plugin/zsh-autosuggestions/zsh-autosuggestions.zsh

FZF_CTRL_T_OPTS=--walker=file,dir
FZF_ALT_C_OPTS=--walker=dir
if command -v fzf >/dev/null; then
    source <(fzf --zsh)
fi
