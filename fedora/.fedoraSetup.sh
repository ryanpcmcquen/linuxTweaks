#!/bin/sh
# Run as a normal user:
# wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/fedora/.fedoraSetup.sh -P ~/; sh ~/.fedoraSetup.sh

# Always good to start with an update.
sudo dnf -y upgrade || sudo yum -y update

# Sets up some nice Gnome defaults.
if [ `which gnome-shell` ]; then
  wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.gnome3Setup -P ~/; bash ~/.gnome3Setup
fi

# Configure KDE if present:
if [ `which startkde` ]; then
  wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.kdeSetup.sh -P ~/; bash ~/.kdeSetup.sh
fi

# Mate!
if [ `which mate-panel` ]; then
  wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.mateSetup.sh -P ~/; bash ~/.mateSetup.sh
fi

# Sets up: Git, Vim, Emacs, SSH and some nice environment goodies.
wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.genericLinuxConfig.sh -P ~/
sh ~/.genericLinuxConfig.sh

# Pretty sure the first few are included, but it can't hurt.
ESSENTIALPKGS="curl wget make git vim vim-X11 emacs gcc gcc-c++ \
clang libXrandr-devel kernel-headers kernel-devel zlib-devel \
libsndfile-devel SDL-devel scite jpegoptim optipng pngquant \
gifsicle exiv2"

# If dnf fails, the system is probably older.
sudo dnf -y install $ESSENTIALPKGS || sudo yum -y install $ESSENTIALPKGS

cd
if [ ! -d ~/.iris/ ]; then
    git clone https://github.com/danielng01/iris-floss.git .iris
    cd ~/.iris/
    make
    sudo ln -sf ~/.iris/iris-floss /usr/local/bin/
fi
cd

# SciTE configuration:
wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.SciTEUser.properties -P ~/

# Imgult:
wget -N https://raw.githubusercontent.com/ryanpcmcquen/image-ultimator/master/imgult; sudo install -m755 imgult /usr/local/bin/; rm imgult

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
