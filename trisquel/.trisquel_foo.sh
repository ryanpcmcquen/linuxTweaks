#!/bin/bash

# wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/trisquel/.trisquel_foo.sh -P ~/; bash ~/.trisquel_foo.sh

#####################
# Installing stuff. #
#####################

ESSENTIALS="\
    build-essential chromium-browser curl emacs exfat-fuse exfat-utils exiv2 \
    exuberant-ctags gifsicle git jpegoptim libjpeg-turbo-progs libsdl1.2-dev \
    libsndfile1-dev libx11-dev libxrandr-dev make optipng pngquant scite \
    texlive-latex-extra vim vlc wget xorg-dev zlib1g-dev \
"

sudo add-apt-repository -y ppa:canonical-chromium-builds/stage
sudo apt-get update && sudo apt-get dist-upgrade -y
sudo apt-get autoclean && sudo apt-get clean && sudo apt-get autoremove -y

sudo apt-get install -y $ESSENTIALS

# Haskell!
curl -sSL https://get.haskellstack.org/ | sh
# Reset to haskell-vim-now's settings:
#ln -sf ~/.config/haskell-vim-now/.vimrc ~/
#ln -sf ~/.config/haskell-vim-now/.vim ~/
#curl -L https://git.io/haskell-vim-now > /tmp/haskell-vim-now.sh
#bash /tmp/haskell-vim-now.sh

# Imgult!
wget -N https://raw.githubusercontent.com/ryanpcmcquen/image-ultimator/master/imgult \
    && sudo install -m755 imgult /usr/local/bin/ \
    && rm imgult

# Iris:
cd
if [ ! -d ~/.iris/ ]; then
    git clone https://github.com/danielng01/iris-floss.git .iris
    cd ~/.iris/
    make
    sudo ln -sf ~/.iris/iris-floss /usr/local/bin/
fi
cd

# Keybase:
cd
if [ -z "`which run_keybase`" ]; then
    curl -O https://prerelease.keybase.io/keybase_amd64.deb
    sudo dpkg -i keybase_amd64.deb
    sudo apt-get install -y -f
    rm keybase_amd64.deb
    run_keybase
fi
cd

# Killr!
wget -N https://gist.githubusercontent.com/ryanpcmcquen/7f6b8e1d4f9af71070a0ec59576d4d5b/raw/killr -P ~/ \
    && sudo install -m755 ~/killr /usr/local/bin/ \
    && rm ~/killr

# Password generator:
wget -N https://gist.githubusercontent.com/ryanpcmcquen/a57201e1c8cb31bda6bce9104092725a/raw/password -P ~/ \
    && chmod +x ~/password

# Powerline fonts:
powerline_install() {
    cd ~/.powerline-fonts/
    git pull
    ~/.powerline-fonts/install.sh
}

if [ -d ~/.powerline-fonts/ ]; then
    powerline_install
else
    git clone https://github.com/powerline/fonts.git ~/.powerline-fonts/
    powerline_install
fi
cd

# Textadept:
wget -N https://gist.githubusercontent.com/ryanpcmcquen/655cb3cc60f9d064738903e59504a5fd/raw/installLatestTextadept.sh -P /tmp/ \
    && bash /tmp/installLatestTextadept.sh


######################
# Configuring stuff. #
######################

# Add 'Chromebook' keyboard layout.
wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.add_chromebook_keyboard_layout.sh -P ~/
sudo bash ~/.add_chromebook_keyboard_layout.sh

# A whole bunch of configuration goodies:
wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.genericLinuxConfig.sh -P ~/
sh ~/.genericLinuxConfig.sh

# Fix headphone audio:
sudo wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/alsa-base.conf -P /etc/modprobe.d/

# SciTE configuration:
wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.SciTEUser.properties -P ~/

# Sets up some nice defaults for Mate, including a fast key repeat.
curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.mateSetup.sh | sh

# Set the default editor:
if [ "`which vim.basic`" ]; then
    sudo update-alternatives --set editor $(which vim.basic)
fi
