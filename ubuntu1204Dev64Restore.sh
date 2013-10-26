#!/bin/sh

echo "# my aliases
alias aptu='sudo apt-get update && sudo apt-get dist-upgrade -y'
alias aptc='sudo apt-get autoclean && sudo apt-get clean && sudo apt-get autoremove -y'
alias apti='sudo apt-get install '" >> ~/.bashrc

sudo apt-get update && sudo apt-get dist-upgrade -y

sudo apt-get install build-essential linux-generic git git-core curl htop vim ruby ruby-dev rubygems python-dev python-setuptools python-pip dkms virtualbox mc

sudo add-apt-repository -y ppa:libreoffice/ppa
sudo add-apt-repository -y ppa:shutter/ppa
sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp
sudo add-apt-repository -y "deb http://repository.spotify.com stable non-free"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59

sudo apt-get update && sudo apt-get install skype libreoffice shutter gimp spotify-client

sudo apt-get autoclean && sudo apt-get clean && sudo apt-get autoremove -y

cd ~/Downloads
wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_*_amd64.deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget http://c758482.r82.cf2.rackcdn.com/sublime-text_build-*_amd64.deb

## sed -i "/^# deb .*partner/ s/^# //" /etc/apt/sources.list && apt-get update
