### basic
[[ -d $HOME/.zsh ]] || mkdir $HOME/.zsh

autoload -Uz add-zsh-hook

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

function _zshrc_auto_ls {
    [[ $PWD == $HOME ]] && return
    timeout 0.1 ls -v --group-directories-first --color=auto 2>/dev/null
}
add-zsh-hook chpwd _zshrc_auto_ls

### prompt
setopt prompt_subst
PROMPT=
PROMPT+='${CONTAINER_ID:+($CONTAINER_ID) }'
PROMPT+='%(!.%F{red}.%F{blue})%B%n%b%f@%m '
PROMPT+='%40<...<%B%~%b%<< '
PROMPT+='%(?..%F{red})%(!.#.$)%f '

function _zshrc_set_title { print -Pn -- '\e]2;%n@%m\a' }
add-zsh-hook precmd _zshrc_set_title

### editing
bindkey -e

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^P' up-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

### completion
fpath=($fpath $HOME/.zsh/plugin/zsh-completions/src)

autoload -Uz compinit
compinit -d $HOME/.zsh/compdump

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

### alias
alias dotfiles='git --git-dir="$HOME/.local/share/dotfiles" --work-tree="$HOME"'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'

alias lc='ls --color=auto -v --group-directories-first -C'
alias ll='ls --color=auto -v --group-directories-first -l -h'
alias la='ls --color=auto -v --group-directories-first -l -h -A'

### plugin
source $HOME/.zsh/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/plugin/zsh-autosuggestions/zsh-autosuggestions.zsh

FZF_CTRL_T_OPTS=--walker=file,dir
FZF_ALT_C_OPTS=--walker=dir
command -v fzf >/dev/null && source <(fzf --zsh)
