#!/bin/bash

################
# Source utils #
################
source ./utils.sh

cecho $YELLOW "Installing OS Dependencies..."
sudo apt-get update
sudo apt-get install -y libfreetype6-dev libxft-dev libffi-dev libxml2-dev libxslt1-dev python-dev freetds-dev python-pip libopenblas-dev liblapack-dev ipython language-pack-en zsh tmux

cecho $YELLOW "Installing virtualenv..."
sudo pip install virtualenv
sudo pip install autoenv

cecho $YELLOW "Creating a new Virtualenv at ~..."
virtualenv ~/default

cecho $YELLOW "Installing Python Dependencies..."
source ~/default/bin/activate
pip install -r requirements.txt

# Add stuff to ~/.bashrc
ACTIVATE="source `which activate.sh`"
grep "$ACTIVATE" ~/.bashrc || cecho $YELLOW "Setting auto sourcing of venv in ~/.bashrc" ; echo "$ACTIVATE" >> ~/.bashrc
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
BOOTSTRAPCMD="alias bootstrap=/bin/bash $SCRIPTPATH/bootstrap.sh"
grep "$BOOTSTRAPCMD" ~/.bashrc || cecho $YELLOW "Adding command 'bootstrap' in ~/.bashrc"; echo "$BOOTSTRAPCMD" >> ~/.bashrc

cecho $GREEN "Initial setup complete"
