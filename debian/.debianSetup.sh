#!/bin/sh
## wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/debian/.debianSetup.sh -P ~/; bash ~/.debianSetup.sh
## Basically just Gnome and Git/Vim/Emacs stuff.

## Uncomment if you set up `sudo`:
#sudo apt-get update && sudo apt-get dist-upgrade -y
#sudo apt-get install git curl build-essential vim emacs

wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.gnome3Setup -P ~/; bash ~/.gnome3Setup

wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.gitVimNORMALorROOT.sh -P ~/; bash ~/.gitVimNORMALorROOT.sh

wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.emacs -P ~/

wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.genericLinuxConfig.sh -P ~/; sh ~/.genericLinuxConfig.sh
