#!/bin/sh
## run as a normal user

## thanks to @fmuellner
## variables for gsettings
KEYS_SCHEMA=org.gnome.settings-daemon.plugins.media-keys
CUSTOM_SCHEMA=${KEYS_SCHEMA}.custom-keybinding
CUSTOM_PATH=/${CUSTOM_SCHEMA//.//}s/custom0/
## set the terminal shortcut to ctrl+alt+t
gsettings set $CUSTOM_SCHEMA:$CUSTOM_PATH name 'Terminal'
gsettings set $CUSTOM_SCHEMA:$CUSTOM_PATH command 'gnome-terminal'
gsettings set $CUSTOM_SCHEMA:$CUSTOM_PATH binding '<Control><Alt>t'
gsettings set $KEYS_SCHEMA custom-keybindings "[\"$CUSTOM_PATH\"]"

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

