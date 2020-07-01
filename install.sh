#!/bin/bash

DOTFILES='.dotfiles'

cd ~
mkdir -p ~/.config

#
# Zsh
#

# Colorls dependency.
if ! [ -x "$(command -v colorls)" ]; then
    sudo gem install colorls
    echo ">>> Installed colorls"
fi

# Grc dependency.
if ! [ -x "$(command -v grc)" ]; then
    brew install grc
    echo ">>> Installed grc"
fi

ln -sFfh ~/$DOTFILES/oh-my-zsh/ ~/.oh-my-zsh
ln -sFfh ~/$DOTFILES/oh-my-zsh/zshrc ~/.zshrc
echo ">>> Installed zhs config"

#
# Alacritty
#

ln -sFfh ~/$DOTFILES/alacritty ~/.config/alacritty
echo ">>> Installed alacritty config"

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

ln -sFfh ~/$DOTFILES/nvim ~/.config/nvim
nvim +PlugInstall +qall
echo ">>> Installed nvim config"
if [ ! -d ~/.pyenv/nvimenv ]; then
    mkdir -p ~/.pyenv
    cd ~/.pyenv
    virtualenv -p python3 nvimenv
    ./nvimenv/bin/pip install pynvim
    ./nvimenv/bin/python -c 'import pynvim'
    echo ">>> Installed nvim python support"
fi
echo ">>> Do not forget to install VimR: https://github.com/qvacua/vimr/releases"

