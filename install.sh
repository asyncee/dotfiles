#!/bin/bash

fail() {
    echo -e "\033[33;31m$1\033[33;0m"
}

DOTFILES='~/.dotfiles'

# Check for dotfiles dir.
if [ -d "$DOTFILES" ]; then
    fail "ERROR: $DOTFILES directory already exists! Please remove it and try again."
    exit
fi

# Clone dotfiles.
git clone https://github.com/asyncee/dotfiles.git $DOTFILES

# Install zsh
if ! [ -x "$(command -v colorls)" ]; then
    echo "Installing colorls"
    sudo gem install colorls
fi
ln -s $DOTFILES/oh-my-zsh ~/.oh-my-zsh || fail "Error: ~/.oh-my-zsh already exists!"
ln -s $DOTFILES/oh-my-zsh/zshrc ~/.zshrc || fail "Error: ~/.zshrc already exists!"
