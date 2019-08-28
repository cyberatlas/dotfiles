#! /bin/sh

# Install HomeBrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Update for good measure
brew update

# Upgrade packages
brew upgrade

# Install git 
brew install git 

# Get the dotlfiles that I like
git clone https://github.com/cyberatlas/dotfiles.git ~/dotfiles

# Make the neovim config folder
mkdir ~/.config/nvim
# Copy the init.vim to the 
cp ~/dotfiles/init.vim ~/.config/nvim/
# Install all of the neovim plugins
nvim -c 'PlugInstall'

# Install Rust for vim live markdown composer
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env

# cd into the proper directory 
cd /.config/nvim/plugged/vim-markdown-composer/
cargo build --release



