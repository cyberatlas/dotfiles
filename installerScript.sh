#!/bin/sh
#Turn echo on
set -x
#Update 
sudo apt-get update -y
#Add the repo that we will use to get python
sudo apt-add-repository ppa:deadsnakes -r -y
sudo apt-add-repository ppa:deadsnakes -y
#Add the repo that we will use to get f.lux
sudo add-apt-repository ppa:nathan-renniewaldock/flux -r -y
sudo add-apt-repository ppa:nathan-renniewaldock/flux -y
#Add the repo that we will use to get java
sudo add-apt-repository ppa:linuxuprising/java -y 
#Add the repo we'll use to get golang
sudo add-apt-repository ppa:longsleep/golang-backports
#Update
sudo apt update
#Install C and such 
sudo apt-get install build-essential manpages-dev -y
#TODO install java
sudo apt-get install java -y
#install python
sudo apt-get install python3 -y
#Install Go 
sudo apt-get install golang-go -y
#Update again for good measure 
sudo apt-get update -y
# Upgrade
sudo apt-get dist-upgrade -y

#install git
sudo apt-get install git -y

#inStall vim 
sudo apt-get install vim -y

# Install neovim
sudo apt-get install neovim -y

# TODO pull Github dotfiles
git clone https://www.github.com/cyberatlas/dotfiles.git ~/
mkdir ~/.config/nvim/
cp ~/dotfiles/init.vim ~/.config/nvim/init.vim

#Put dotfiles in the proper places
#cp ./dotfiles/vimrc ~/.vimrc

#install Snap 
sudo apt install snapd -y

# install Intellij
sudo snap install intellij-idea-ultimate --classic 
#Install Pycharm
sudo snap install pycharm-professional --classic
#install Spotify 
sudo snap install spotify
#Install Slack
sudo snap install slack --classic
#Install f.lux
sudo apt-get install fluxgui -y
#Install UFW
sudo apt-get install ufw -y

#Sadly, install Chrome just in case we need it
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update -y
sudo apt-get install google-chrome-stable -y
#TODO make the theme pretty
#TODO make windows + L the screenlock

#Install Signal Messenger 
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt install signal-desktop

#TODO Set up Wallpaper and Wallpaper switching

##############
# Add Docker #
##############
#Uninstall old verisons
sudo apt-get remove docker docker-engine docker.io containerd runc
#Set up the repo
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo Do I match 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88
sudo apt-key fingerprint 0EBFCD88
#Using bionic in this case, change as needed
# To find version- $(lsb_release -cs) 
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   bionic \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo docker run hello-world
#Create the Docker group
sudo groupadd docker
#Add the current user to the Docker group
sudo usermod -aG docker $USER

#TODO add virtualbox


#Install VSCode
sudo snap install code --classic

#Install zsh
sudo apt-get install zsh -y

#Make zsh the defualt shell
sudo chsh -s $(which zsh)
chsh -s $(which zsh)

#Install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


