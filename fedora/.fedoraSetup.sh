#!/bin/sh
## run as a normal user:
## wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/fedora/.fedoraSetup.sh -P ~/; sh ~/.fedoraSetup.sh

## always good to start with an update
sudo dnf -y upgrade || sudo yum -y update

curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.gnome3Setup | bash

## retrieve git and vim settings
curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/gitVimNORMALorROOT.sh | sh

## pretty sure the first few are included, but it can't hurt
ESSENTIALPKGS="curl wget make git vim vim-X11 gcc gcc-c++ clang kernel-headers kernel-devel zlib-devel libsndfile-devel SDL-devel"

## if dnf fails, the system is probably older
sudo dnf -y install $ESSENTIALPKGS || sudo yum -y install $ESSENTIALPKGS

## google chrome
if [ "`uname -m`" = "x86_64" ]; then
  wget -N https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm -P ~/Downloads/
  sudo dnf -y install ~/Downloads/google-chrome-stable_current_x86_64.rpm \
    || sudo yum -y install ~/Downloads/google-chrome-stable_current_x86_64.rpm
else
  wget -N https://dl.google.com/linux/direct/google-chrome-stable_current_i386.rpm -P ~/Downloads/
  sudo dnf -y install ~/Downloads/google-chrome-stable_current_i386.rpm \
    || sudo yum -y install ~/Downloads/google-chrome-stable_current_i386.rpm
fi

echo
echo "    .--. "
echo "   |o_o | "
echo "   |:_/ | "
echo "  //   \ \ "
echo " (|     | ) "
echo "/'\_   _/'\ "
echo "\___)=(___/ "
echo
echo "A reboot may be necessary."
echo

