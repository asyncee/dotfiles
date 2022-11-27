#!/bin/bash

# NOTE: to launch tmux as a shell: /usr/bin/tmux new-session -A

DOTFILES="$HOME/.dotfiles"
CONFIG="$HOME/.config"
SYSTEM=$(uname -s)

PACKAGES="zsh git git-flow grc tmux fzf ripgrep silversearcher-ag fd-find bat delta gcc"

sudo apt install $PACKAGES

# Link configuration
mkdir -p $CONFIG

# TODO: use mv
rm -rf "$CONFIG/git"
rm -rf "$CONFIG/nvim"
rm -rf "$HOME/.ideavimrc"
rm -rf "$HOME/.tmux.conf"

ln -sf "$DOTFILES/git" "$CONFIG/git"
ln -sf "$DOTFILES/ideavimrc" "$HOME/.ideavimrc"
ln -sf "$DOTFILES/nvim" "$CONFIG/nvim"
ln -sf "$DOTFILES/tmux.conf" "$HOME/.tmux.conf"

# Oh-my-zsh
rm -rf "$HOME/.oh-my-zsh"
rm "$HOME/.zshrc"
RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm "$HOME/.zshrc"
ln -sf "$DOTFILES/oh-my-zsh/zshrc" "$HOME/.zshrc"

nvim +PackerInstall
nvim +Mason
