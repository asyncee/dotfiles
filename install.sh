#!/bin/bash

DOTFILES="$HOME/.dotfiles"
CONFIG="$HOME/.config"
PYNVIMENVDIR="$HOME/.pyenv"

mkdir -p $CONFIG
mkdir -p $PYNVIMENVDIR

#
# Git
#
ln -sFfh "$DOTFILES/git" "$CONFIG/git"
echo ">>> Installed git config"

#
# IdeaVIM
#
ln -sFfh "$DOTFILES/ideavimrc" "$HOME/.ideavimrc"
echo ">>> Installed .ideavimrc"

#
# Kitty
#
ln -sFfh "$DOTFILES/kitty" "$CONFIG/kitty"
echo ">>> Installed Kitty config"

#
# Hammerspoon
#
ln -sFfh "$DOTFILES/hammerspoon" "$HOME/.hammerspoon"
echo ">>> Installed Hammerspoon config"

#
# Zsh
#

# Grc dependency.
if ! [ -x "$(command -v grc)" ]; then
    brew install grc
    echo ">>> Installed grc"
fi

# Oh-my-zsh
rm -rf "$HOME/.oh-my-zsh"
rm "$HOME/.zshrc"
RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm "$HOME/.zshrc"
ln -sFfh "$DOTFILES/oh-my-zsh/zshrc" "$HOME/.zshrc"
echo ">>> Installed zsh config"

#
# Vim
#

if ! [ -x "$(command -v nvim)" ]; then
    brew install nvim
    echo ">>> Installed neovim"
fi

if ! [ -x "$(command -v fzf)" ]; then
    brew install fzf
    echo ">>> Installed fzf"
fi

if ! [ -x "$(command -v rg)" ]; then
    brew install rg
    echo ">>> Installed rg"
fi

ln -sFfh "$DOTFILES/nvim" "$CONFIG/nvim"
nvim +PlugInstall +qall
echo ">>> Installed nvim config"
if [ ! -d "$PYNVIMENVDIR/nvimenv" ]; then
    virtualenv -p python3 "$PYNVIMENVDIR/nvimenv"
    $PYNVIMENVDIR/nvimenv/bin/pip install pynvim
    $PYNVIMENVDIR/nvimenv/bin/python -c 'import pynvim'
    echo ">>> Installed nvim python support"
fi
echo ">>> Do not forget to install VimR: https://github.com/qvacua/vimr/releases"
