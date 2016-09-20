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

cecho $YELLOW "Setting auto sourcing of default virtualenv"
echo "source `which activate.sh`" >> ~/.bashrc

cecho $GREEN "Initial setup complete"
