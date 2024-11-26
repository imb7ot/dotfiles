set -eu
git clone --bare --depth=1 https://gitlab.com/imb7ot/dotfile.git "$HOME/.local/share/dotfile/git"
alias dotfile='git --git-dir="$HOME/.local/share/dotfile/git" --work-tree="$HOME"'
dotfile checkout -f
dotfile config --local status.showUntrackedFiles no
