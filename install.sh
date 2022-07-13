#!/bin/bash

DOTFILES="$HOME/.dotfiles"
CONFIG="$HOME/.config"
PYNVIMENVDIR="$HOME/.pyenv"

mkdir -p $CONFIG

#
# Git
#
brew install git git-flow-avh
ln -sFfh "$DOTFILES/git" "$CONFIG/git"
echo ">>> Installed git config"

#
# IdeaVIM
#
ln -sFfh "$DOTFILES/ideavimrc" "$HOME/.ideavimrc"
echo ">>> Installed .ideavimrc"

#
# Hammerspoon
#
ln -sFfh "$DOTFILES/hammerspoon" "$HOME/.hammerspoon"
echo ">>> Installed Hammerspoon config"

#
# Zsh
#

# Grc
brew install grc
echo ">>> Installed grc"

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
    echo ">>> Installed neovim at least 0.8.0"
    open https://github.com/neovim/neovim/releases/nightly
fi

brew install tmux
echo ">>> Installed tmux"

brew install fzf ripgrep ag stylua fd bat delta ag gotags golangci-lint
echo ">>> Installed extra deps"

ln -sFfh "$DOTFILES/nvim" "$CONFIG/nvim"
nvim +PackerInstall
echo ">>> Installed nvim config"
