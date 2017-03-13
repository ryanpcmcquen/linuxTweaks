#!/bin/sh
## Run as a normal user:
## wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/fedora/.fedoraSetup.sh -P ~/; sh ~/.fedoraSetup.sh

## Always good to start with an update.
sudo dnf -y upgrade || sudo yum -y update

## Sets up some nice Gnome defaults.
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

## Sets up: Git, Vim, Emacs, SSH and some nice environment goodies.
wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.genericLinuxConfig.sh -P ~/
sh ~/.genericLinuxConfig.sh

## Pretty sure the first few are included, but it can't hurt.
ESSENTIALPKGS="curl wget make git vim vim-X11 emacs gcc gcc-c++ clang kernel-headers kernel-devel zlib-devel libsndfile-devel SDL-devel"

## If dnf fails, the system is probably older.
sudo dnf -y install $ESSENTIALPKGS || sudo yum -y install $ESSENTIALPKGS

## Google chrome:
wget -N https://dl.google.com/linux/direct/google-chrome-beta_current_x86_64.rpm -P ~/Downloads/
sudo dnf -y install ~/Downloads/google-chrome-beta_current_x86_64.rpm \
  || sudo yum -y install ~/Downloads/google-chrome-beta_current_x86_64.rpm

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
