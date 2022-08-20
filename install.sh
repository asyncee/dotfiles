#!/bin/bash

# NOTE: to launch tmux as a shell: /usr/bin/tmux new-session -A

DOTFILES="$HOME/.dotfiles"
CONFIG="$HOME/.config"
SYSTEM=$(uname -s)

BREW_PACKAGES="git git-flow-avh grc tmux fzf ripgrep the_silver_searcher fd      bat      delta"
DEB_PACKAGES=" git git-flow     grc tmux fzf ripgrep silversearcher-ag   fd-find bat      delta gcc"
RPM_PACKAGES="                  grc tmux fzf ripgrep the_silver_searcher fd-find                gcc zsh"

# Install packages
if [ "$SYSTEM" = "Darwin" ]; then
    brew install $BREW_PACKAGES
else
    # Linux Mint
    if [ -x "$(command -v apt)" ]; then
        sudo apt install $DEB_PACKAGES
    # Fedora
    elif [ -x "$(command -v dnf)" ]; then
        sudo dnf install $RPM_PACKAGES
        # Neovim
        sudo dnf copr enable agriffis/neovim-nightly
        sudo dnf install -y neovim python3-neovim
        # git-flow
        wget -q  https://raw.githubusercontent.com/petervanderdoes/gitflow-avh/develop/contrib/gitflow-installer.sh && sudo bash gitflow-installer.sh install stable; sudo rm -rf ./gitflow-installer.sh* ./gitflow
    fi
fi

# Link configuration
mkdir -p $CONFIG

# TODO: use mv
rm -rf "$CONFIG/git"
rm -rf "$CONFIG/nvim"
rm -rf "$HOME/.hammerspoon"
rm -rf "$HOME/.ideavimrc"
rm -rf "$HOME/.tmux.conf"

ln -sf "$DOTFILES/git" "$CONFIG/git"
ln -sf "$DOTFILES/ideavimrc" "$HOME/.ideavimrc"
ln -sf "$DOTFILES/hammerspoon" "$HOME/.hammerspoon"
ln -sf "$DOTFILES/nvim" "$CONFIG/nvim"
ln -sf "$DOTFILES/tmux.conf" "$HOME/.tmux.conf"

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
