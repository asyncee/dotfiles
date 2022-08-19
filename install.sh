#!/bin/bash

DOTFILES="$HOME/.dotfiles"
CONFIG="$HOME/.config"
SYSTEM=$(uname -s)

BREW_PACKAGES="git git-flow-avh grc tmux fzf ripgrep the_silver_searcher fd      bat delta stylua"
DEB_PACKAGES=" git git-flow     grc tmux fzf ripgrep silversearcher-ag   fd-find bat delta        unzip gcc make"

# Install packages
if [ "$SYSTEM" = "Darwin" ]; then
    brew install $BREW_PACKAGES
else
    sudo apt install $DEB_PACKAGES
fi

# Link configuration
mkdir -p $CONFIG

# TODO: use mv
rm -rf "$CONFIG/git"
rm -rf "$CONFIG/nvim"
rm -rf "$HOME/.hammerspoon"
rm -rf "$HOME/.ideavimrc"

ln -sf "$DOTFILES/git" "$CONFIG/git"
ln -sf "$DOTFILES/ideavimrc" "$HOME/.ideavimrc"
ln -sf "$DOTFILES/hammerspoon" "$HOME/.hammerspoon"
ln -sf "$DOTFILES/nvim" "$CONFIG/nvim"

# Oh-my-zsh
rm -rf "$HOME/.oh-my-zsh"
rm "$HOME/.zshrc"
RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm "$HOME/.zshrc"
ln -sf "$DOTFILES/oh-my-zsh/zshrc" "$HOME/.zshrc"

# Vim
if ! [ -x "$(command -v nvim)" ]; then
    echo ">>> Please, install neovim at least 0.8.0 and then run `nvim +PackerInstall`"
    open https://github.com/neovim/neovim/releases/nightly
else
    nvim +PackerInstall
    nvim +Mason
fi
