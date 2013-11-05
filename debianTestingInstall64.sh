#!/bin/sh

sudo apt-get install curl build-essential linux-headers-amd64 git-all htop vim python-dev python-pip python-apt \
  ruby-dev rubygems lftp gftp filezilla dkms mc syslinux nfs-common nfs-kernel-server

## grab google chrome, dropbox, sublime text, vagrant, skype

git config --global user.name "Ryan P.C. McQuen"
git config --global user.email "ryanpcmcquen@gmail.com"
git config --global credential.helper cache

sudo pip install ansible pip-tools
