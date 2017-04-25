#!/bin/bash
## wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/debian/.debianSetup.sh -P ~/; bash ~/.debianSetup.sh
## Basically just Gnome and Git/Vim/Emacs stuff.

if [ "`which sudo`" ]; then
  sudo apt-get update && sudo apt-get dist-upgrade -y
  sudo apt-get install -y git curl build-essential vim emacs chromium
fi

## Gnome 3 setup!
if [ `which gnome-shell` ]; then
  wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.gnome3Setup -P ~/; bash ~/.gnome3Setup
fi

## Configure KDE if present:
if [ `which startkde` ]; then
  wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.kdeSetup.sh -P ~/; bash ~/.kdeSetup.sh
fi

## Mate!
if [ `which mate-panel` ]; then
  wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.mateSetup.sh -P ~/; bash ~/.mateSetup.sh
fi

## Allow remote extensions to run in Chromium.
wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/chromium/enable-remote-extensions -P /etc/chromium.d/

## Set up ssh, Vim, Emacs and more.
wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.genericLinuxConfig.sh -P ~/; sh ~/.genericLinuxConfig.sh
