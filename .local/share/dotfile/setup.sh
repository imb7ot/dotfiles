set -eu
git clone --bare --depth=1 https://gitlab.com/imb7ot/dotfile.git "$HOME/.local/share/dotfile/git"
alias dotfile='git -C "$HOME" --git-dir="$HOME/.local/share/dotfile/git" --work-tree=.'
dotfile config --local status.showUntrackedFiles no
dotfile checkout -f
dotfile submodule update --init --recursive
