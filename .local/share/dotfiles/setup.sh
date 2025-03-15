set -eu
git clone --bare --depth=1 https://gitlab.com/imb7ot/dotfiles.git "$HOME/.local/share/dotfiles/git"
alias dotfiles='git -C "$HOME" --git-dir="$HOME/.local/share/dotfiles/git" --work-tree=.'
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout -f
dotfiles submodule update --init --recursive
