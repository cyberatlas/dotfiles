#!/bin/sh
sudo pacman -Syu --no-confirm --no-confirm --no-confirm

# Install and start firewall
sudo pamac install ufw --no-confirm
sudo systemctl enable ufw.service
sudo ufw enable
sudo pamac install gufw --no-confirm

# Install zsh
sudo pamac install zsh
# Make zsh the default shell
sudo chsh -s $(which zsh)
chsh -s $(which zsh)
# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Neovim
sudo pamac install neovim
# Install Vim Plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Get muh dotfiles and such
git clone https://github.com/cyberatlas/dotfiles.git ~/dotfiles
# Make the neovim config folder
mkdir ~/.config/nvim
# Copy the init.vim to the 
cp ~/dotfiles/init.vim ~/.config/nvim/
# Install the nvim plugins
nvim -c 'PlugInstall'

# I need the most recent version of Rust to install vim-markdown-composer 
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/bin

# Change into the proper directory and build everything
cd ~/.config/.nvim/plugged/vim-markdown-composer/
cargo build --release
cd ~

# Install Flatpak
echo "Press Enter and Y" 
sudo pamac install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install snapd
sudo pacman -S snapd 
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

# Install Signal
flatpak install flathub org.signal.Signal -y
# Run Signal
echo "To run signal"
echo "flatpak run org.signal.Signal"

# Install VSCode 
sudo snap install vscode --classic
