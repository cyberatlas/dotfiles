#!/bin/sh
#Turn echo on
set -x

# Install pyenv and the pyenv-virtualenv plugin and set proper environment variables
curl https://pyenv.run | bash

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc

echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc

# exec "$SHELL"

# echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc

git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv

# exec "$SHELL"

# Example Usage
# pyenv pyenv install 3.8.2
# pyenv virtualenv 3.8.2 virtualenvname

# Install Pycharm
sudo snap install pycharm-professional --classic
# Change to this if you don't have professional
# sudo snap install pycharm-community --classic

# TODO setup settings and prefences for pycharm 


exec "$SHELL"
