#!/bin/bash

################
# Source utils #
################
source ./utils.sh

cecho $YELLOW "Installing OS Dependencies..."
sudo apt-get update
sudo apt-get install -y libfreetype6-dev libxft-dev libffi-dev libxml2-dev     \
												libxslt1-dev python python-dev freetds-dev python-pip  \
												libopenblas-dev liblapack-dev ipython language-pack-en \
												zsh tmux
sudo apt-get install -y build-essential clang libdbus-1-dev libgtk2.0-dev      \
                        libnotify-dev libgnome-keyring-dev libgconf2-dev       \
                        libasound2-dev libcap-dev libcups2-dev libxtst-dev     \
                        libxss1 libnss3-dev gcc-multilib g++-multilib curl     \
                        gperf bison
sudo apt-get install vim tmux htop python python-pip git


cecho $YELLOW "Installing virtualenv..."
sudo pip install virtualenv
sudo pip install autoenv

cecho $YELLOW "Creating a new Virtualenv at ~..."
virtualenv ~/default

cecho $YELLOW "Installing Python Dependencies..."
source ~/default/bin/activate
pip install -r requirements.txt

cecho $YELLOW "Installing Node Version Manager (nvm)..."
curl https://raw.githubusercontent.com/creationix/nvm/v0.16.1/install.sh | sh
source ~/.bashrc
cecho $YELLOW "A new command, nvm, has been added!"

echo "Using NVM to install Node.js, v6.5.0..."
nvm install 6.5.0
nvm alias default 6.5.0
nvm use default

echo "Installing Electron globally..."
npm install electron -g

echo "Installing more stuff to have arm compatible targets for electron..."
sudo apt-get install libc6-dev-armhf-cross linux-libc-dev-armhf-cross \
                       g++-arm-linux-gnueabihf
ACTIVATE="source `which activate.sh`"
grep "$ACTIVATE" ~/.bashrc || cecho $YELLOW "Setting auto sourcing of venv in ~/.bashrc" ; echo "$ACTIVATE" >> ~/.bashrc
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
BOOTSTRAPCMD="alias bootstrap=/bin/bash $SCRIPTPATH/bootstrap.sh"
grep "$BOOTSTRAPCMD" ~/.bashrc || cecho $YELLOW "Adding command 'bootstrap' in ~/.bashrc"; echo "$BOOTSTRAPCMD" >> ~/.bashrc

cecho $RED "Note: When doing any Python development, please make sure to type source ~/itadenv as all of the Python packages are installed in that virtualenvironment"
cecho $GREEN "Initial setup complete..."

