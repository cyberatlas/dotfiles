#!/bin/bash

# In dnf-update is just an alias for upgrade so not in here 
sudo dnf upgrade

# Install zsh
sudo dnf install zsh -y
# Make zsh the defualt shell for your user
chsh -s /bin/zsh
# We'll need to put in password here

# Install oh my zsh
yes | sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Needed to install snaps
sudo ln -s /var/lib/snapd/snap /snap

#Install Neovim
sudo dnf install neovim -y
# Makes the directory for Neovim dotfiles
mkdir ~/.config/nvim/ -p
touch ~/.config/nvim/init.vim

# TODO figure out dotfiles for nvim

# Alias vim for nvim
alias vim="nvim"
# TODO make the alias permanent

# Install Brave Browser
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/

sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

sudo dnf install brave-keyring brave-browser

# Install VLC
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install vlc
sudo dnf install python-vlc

# Install Media Codecs
sudo dnf install gstreamer1-plugins-base gstreamer1-plugins-good gstreamer1-plugins-bad-free gstreamer1-plugins-bad-free-extras gstreamer1-plugins-good-extras libdvdread libdvdnav lsdvd

# Install VirtualBox
cd /etc/yum.repos.d
sudo wget https://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
sudo dnf update
yes | yum search virtualbox
sudo dnf install @development-tools -y
sudo dnf install kernel-devel kernel-headers dkms elfutils-libelf-devel qt5-qtx11extras -y
sudo dnf install VirtualBox-6.0 -y

# Install VSCode
sudo snap install code --classic

# TODO install screenfetch and at the end print the complete message and open screenfetch

