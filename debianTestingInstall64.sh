#!/bin/sh

sudo apt-get install curl build-essential linux-headers-amd64 git-all htop dos2unix vim python-dev python-pip python-apt \
  ruby-dev rubygems lftp gftp filezilla dkms mc syslinux nfs-common nfs-kernel-server rpcbind asciidoc

## grab google chrome, dropbox, sublime text, vagrant, skype

git config --global user.name "Ryan P.C. McQuen"
git config --global user.email "ryanpcmcquen@gmail.com"
git config --global credential.helper cache

sudo pip install ansible pip-tools


echo "
 ## my aliases
alias aptu='sudo apt-get update && sudo apt-get dist-upgrade -y'
alias aptc='sudo apt-get autoclean && sudo apt-get clean && sudo apt-get autoremove -y'
alias apti='sudo apt-get install '" >> ~/.bashrc
