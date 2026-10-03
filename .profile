case ":$PATH:" in
    *":$HOME/.local/bin:"*) ;;
    *) PATH="$HOME/.local/bin:$PATH" ;;
esac
export PATH

export EDITOR=vim
export PAGER=less

export LESS=FRX

export GOPATH=$HOME/.local/share/go
export GOMODCACHE=$HOME/.cache/go/mod
export RUSTUP_HOME=$HOME/.local/share/rustup
export CARGO_HOME=$HOME/.local/share/cargo
export PYTHON_HISTORY=$HOME/.local/state/python_history
