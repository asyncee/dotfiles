#!/bin/bash

fail() {
    echo -e "\033[33;31m$1\033[33;0m"
}

DOTFILES='.dotfiles'

cd ~

# Zsh

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

ln -s $DOTFILES/oh-my-zsh ~/.oh-my-zsh || fail "Error: ~/.oh-my-zsh already exists!"
ln -s $DOTFILES/oh-my-zsh/zshrc ~/.zshrc || fail "Error: ~/.zshrc already exists!"
