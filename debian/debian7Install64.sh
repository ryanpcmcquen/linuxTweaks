#!/bin/sh

## add user with visudo

sudo dpkg --add-architecture i386

## add wheezy-backports to sources.list, just copy wheezy-updates lines and change updates to backports

sudo apt-get update && sudo apt-get dist-upgrade -y


sudo apt-get install curl build-essential linux-headers-amd64 git htop dos2unix vim python-dev python-pip devscripts \
  ffmpeg lintian git-buildpackage ruby-dev rubygems lftp gftp filezilla mc syslinux nfs-kernel-server asciidoc


## sudo apt-get install fglrx-driver


git config --global user.name "Ryan P. C. McQuen"
git config --global user.email "ryanpcmcquen@member.fsf.org"
git config --global credential.helper cache


sudo pip install ansible pip-tools


su
touch /etc/apt/sources.list.d/vbox.list
echo "deb http://download.virtualbox.org/virtualbox/debian wheezy contrib" >> /etc/apt/sources.list.d/vbox.list
exit
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -


echo "
 ## my aliases
alias aptu='sudo apt-get update && sudo apt-get dist-upgrade -y'
alias aptc='sudo apt-get autoclean && sudo apt-get clean && sudo apt-get autoremove -y'
alias apti='sudo apt-get install '" >> ~/.bashrc


## grab google chrome, vagrant

##########
## for spotify ##
# 1. Add this line to your list of repositories by
#    editing your /etc/apt/sources.list
# deb http://repository.spotify.com stable non-free

# 2. If you want to verify the downloaded packages,
#    you will need to add our public key
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59

# 3. Run apt-get update
# sudo apt-get update

# 4. Install spotify!
# sudo apt-get install spotify-client
##########


sudo apt-get autoclean && sudo apt-get clean && sudo apt-get autoremove -y

