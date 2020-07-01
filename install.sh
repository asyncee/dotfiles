#!/bin/bash

DOTFILES='.dotfiles'

cd ~

#
# Zsh
#

# Colorls dependency.
if ! [ -x "$(command -v colorls)" ]; then
    echo "Installing colorls"
    sudo gem install colorls
fi

# Grc dependency.
if ! [ -x "$(command -v grc)" ]; then
    echo "Installing grc"
    brew install grc
fi

ln -sFfh ~/$DOTFILES/oh-my-zsh/ ~/.oh-my-zsh
ln -sFfh ~/$DOTFILES/oh-my-zsh/zshrc ~/.zshrc

#
# Alacritty
#

mkdir -p ~/.config
ln -sFfh ~/$DOTFILES/alacritty ~/.config/alacritty
