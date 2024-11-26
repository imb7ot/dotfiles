set -eu
git clone --bare --depth=1 https://gitlab.com/imb7ot/dotfile.git "$HOME/.local/share/dotfile/git"
alias dotfile='git --git-dir="$HOME/.local/share/dotfile/git" --work-tree="$HOME"'
dotfile config --local status.showUntrackedFiles no
dotfile checkout --recurse-submodules -f
