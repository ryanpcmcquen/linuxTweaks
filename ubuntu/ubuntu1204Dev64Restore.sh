#!/bin/sh

echo "# my aliases
alias aptu='sudo apt-get update && sudo apt-get dist-upgrade -y'
alias aptc='sudo apt-get autoclean && sudo apt-get clean && sudo apt-get autoremove -y'
alias apti='sudo apt-get install '" >> ~/.bashrc

sudo apt-get update && sudo apt-get dist-upgrade -y

sudo apt-get install build-essential autoconf automake autotools-dev dh-make debhelper devscripts fakeroot xutils lintian \
  pbuilder linux-generic git wget curl lftp htop vim gksu dos2unix ruby ruby-dev rubygems \
  python-dev python-setuptools python-pip python-apt dkms gftp filezilla mc git-buildpackage \
  nfs-common nfs-kernel-server rpcbind asciidoc


sudo add-apt-repository -y ppa:libreoffice/ppa
sudo add-apt-repository -y ppa:maarten-baert/simplescreenrecorder
sudo add-apt-repository -y ppa:shutter/ppa
sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp
sudo add-apt-repository -y "deb http://repository.spotify.com stable non-free"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59

sudo apt-get update && sudo apt-get install skype ubuntu-restricted-extras libreoffice simplescreenrecorder simplescreenrecorder-lib:i386 shutter gimp spotify-client

sudo apt-get autoclean && sudo apt-get clean && sudo apt-get autoremove -y

git config --global user.name "Ryan P. C. McQuen"
git config --global user.email "ryanpcmcquen@member.fsf.org"
git config --global credential.helper cache

# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BB901940
# sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 614C4B38
# wget -q https://dl-ssl.google.com/linux/linux_signing_key.pub -O- | sudo apt-key add -
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1378B444
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B9BA26FA
# wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add -
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4E9CFF4E
# wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
#  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F9CB8DB0

cd ~/Downloads
#wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_*_amd64.deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#wget http://c758482.r82.cf2.rackcdn.com/sublime-text_build-*_amd64.deb

## sed -i.bak "/^# deb .*partner/ s/^# //" /etc/apt/sources.list && apt-get update
