export PATH=$HOME/.local/bin:$PATH

export EDITOR=vim
export PAGER=less

export ALL_PROXY=http://127.0.0.1:7890
export HTTP_PROXY=$ALL_PROXY
export HTTPS_PROXY=$ALL_PROXY
export FTP_PROXY=$ALL_PROXY

export RUSTUP_HOME=${XDG_DATA_HOME:-$HOME/.local/share}/rustup
export CARGO_HOME=${XDG_DATA_HOME:-$HOME/.local/share}/cargo
export GOPATH=${XDG_DATA_HOME:-$HOME/.local/share}/go
export GOMODCACHE=${XDG_DATA_HOME:-$HOME/.local/share}/go/mod
export WINEPREFIX=${XDG_DATA_HOME:-$HOME/.local/share}/wine
export NPM_CONFIG_USERCONFIG=${XDG_CONFIG_HOME:-$HOME/.config}/npm/npmrc

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
