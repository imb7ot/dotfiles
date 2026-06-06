pathmunge() {
    case ":${PATH}:" in
        *:"$1":*)
            return
    esac
    if [ "$2" = "after" ]; then
        PATH=$PATH:$1
    else
        PATH=$1:$PATH
    fi
}
pathmunge "$HOME/.local/bin"
pathmunge "$HOME/.local/utils" after
unset -f pathmunge

export PATH

export EDITOR=vim
export PAGER=less

export LESS=FRX

export GOPATH=$HOME/.local/share/go
export GOMODCACHE=$HOME/.cache/go/mod
export RUSTUP_HOME=$HOME/.local/share/rustup
export CARGO_HOME=$HOME/.local/share/cargo
export PYTHON_HISTORY=$HOME/.local/state/python_history
