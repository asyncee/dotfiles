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
# Zsh
#

# Colorls dependency.
if ! [ -x "$(command -v colorls)" ]; then
    brew tap homebrew/cask-fonts
    brew cask install font-hack-nerd-font
    sudo gem install colorls
    ln -sFfh "$DOTFILES/colorls" "$CONFIG/colorls"
    echo ">>> Installed colorls and nerd fonts"
fi

# Grc dependency.
if ! [ -x "$(command -v grc)" ]; then
    brew install grc
    echo ">>> Installed grc"
fi

ln -sFfh "$DOTFILES/oh-my-zsh/" "$HOME/.oh-my-zsh"
ln -sFfh "$DOTFILES/oh-my-zsh/zshrc" "$HOME/.zshrc"
echo ">>> Installed zhs config"

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
