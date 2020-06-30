# Work in home directory.
cd ~

# Clone dotfiles.
git clone https://github.com/asyncee/dotfiles.git ~/.dotfiles

# Install zsh
ln -s ~/.dotfiles/oh-my-zh ~/.oh-my-zsh
ln -s ~/.dotfiles/oh-my-zsh/zshrc ~/.zshrc
