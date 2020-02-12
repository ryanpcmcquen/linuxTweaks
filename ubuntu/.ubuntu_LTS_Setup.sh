#!/bin/bash
# Run as a normal user:
# wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/ubuntu/.ubuntu_LTS_Setup.sh -P ~/; bash ~/.ubuntu_LTS_Setup.sh

# Tested on 14.04, 16.04, 18.04, and 20.04.

wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.__KEY_REPEAT_SETTINGS__ -P ~/
. ~/.__KEY_REPEAT_SETTINGS__

sudo apt-get update && sudo apt-get dist-upgrade -y

if [ -z "$(grep 'xterm-256color' ~/.bashrc)" ]; then
    echo >> ~/.bashrc
    echo 'if [ "$DISPLAY" ]; then' >> ~/.bashrc
    echo '    export TERM=xterm-256color' >> ~/.bashrc
    echo 'fi' >> ~/.bashrc
fi

# Get list of packages to install:
wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/debian/._SWEETPKGS_ -P ~/
. ~/._SWEETPKGS_

sudo apt-get install -y ${SWEETPKGS}

#################################
##### Desktop environments. #####
#################################

# Only run Gnome 3 setup if Unity is not installed.
if [ ! `which unity` ] && [ `which gnome-shell` ]; then
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.gnome3Setup -P ~/; bash ~/.gnome3Setup
fi

# Configure KDE if present (Kubuntu):
if [ `which startkde` ] || [ `which kwin` ]; then
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.kdeSetup.sh -P ~/; bash ~/.kdeSetup.sh
fi

# Configure LXQt if present:
if [ -e ${HOME}/.config/lxqt/session.conf ]; then
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.lxqtSetup -P ~/; bash ~/.lxqtSetup
fi

# Mate!
if [ `which mate-panel` ]; then
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.mateSetup.sh -P ~/; bash ~/.mateSetup.sh
fi

# Pantheon (Elementary OS)!
if [ `which pantheon-greeter` ] || [ `which io.elementary.greeter` ] || [ `which pantheon-mail` ]; then
    gsettings set org.gnome.desktop.peripherals.keyboard delay ${KEY_REPEAT_DELAY}
    gsettings set org.gnome.desktop.peripherals.keyboard repeat true
    gsettings set org.gnome.desktop.peripherals.keyboard repeat ${KEY_REPEAT_RATE}

    # Map Caps Lock to Ctrl.
    XKB_OPTIONS="$(gsettings get org.gnome.desktop.input-sources xkb-options)"
    [ "$(echo ${XKB_OPTIONS} | grep -v '\[\]')" ] && gsettings set org.gnome.desktop.input-sources xkb-options "$(echo ${XKB_OPTIONS} | sed "s/\[\]/['ctrl:nocaps']/")"
    [ "$(echo ${XKB_OPTIONS} | grep -v 'ctrl:nocaps')" ] && gsettings set org.gnome.desktop.input-sources xkb-options "$(echo ${XKB_OPTIONS} | sed "s/\]/, 'ctrl:nocaps']/")"
fi

# Xfce!
if [ `which startxfce4` ]; then
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.xfceSetup.sh -P ~/; bash ~/.xfceSetup.sh
fi

if [ `which unity` ]; then
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/ubuntu/.unitySetup.sh -P ~/; bash ~/.unitySetup.sh
fi

#################################
######### Applications. #########
#################################

# Haskell!
#curl -sSL https://get.haskellstack.org/ | sh
# Link back to haskell-vim-now settings in case they were overwritten:
#ln -sf ~/.config/haskell-vim-now/.vimrc ~/
#ln -sf ~/.config/haskell-vim-now/.vim ~/
# Haskell-vim-now!
#curl -L https://git.io/haskell-vim-now > /tmp/haskell-vim-now.sh
#bash /tmp/haskell-vim-now.sh

# Imgult!
wget -N https://raw.githubusercontent.com/ryanpcmcquen/image-ultimator/master/imgult \
    && sudo install -m755 imgult /usr/local/bin/ \
    && rm imgult

# Keybase:
if [ -z "`which run_keybase`" ]; then
    cd
    curl -O https://prerelease.keybase.io/keybase_amd64.deb
    sudo dpkg -i keybase_amd64.deb
    sudo apt-get install -y -f
    rm keybase_amd64.deb
    run_keybase
    cd
fi

# Local password generator:
wget -N https://gist.githubusercontent.com/ryanpcmcquen/a57201e1c8cb31bda6bce9104092725a/raw/password -P ~/ \
    && chmod +x ~/password

# nvm:
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

# Textadept:
wget -N https://gist.githubusercontent.com/ryanpcmcquen/655cb3cc60f9d064738903e59504a5fd/raw/.installLatestTextadept.sh -P ~/

##################################
######### Configuration. #########
##################################

# Add 'Chromebook' keyboard layout.
wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.add_chromebook_keyboard_layout.sh -P ~/ \
    && sudo bash ~/.add_chromebook_keyboard_layout.sh

# A whole bunch of goodies:
wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.genericLinuxConfig.sh -P ~/ \
    && sh ~/.genericLinuxConfig.sh

# Fix headphone audio:
#sudo wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/alsa-base.conf -P /etc/modprobe.d/

# Libre wireless dongle drivers:
sudo wget -N https://www.thinkpenguin.com/files/ath9k_firmware_free-version/htc_9271.fw -P /lib/firmware
sudo wget -N https://www.thinkpenguin.com/files/ath9k_firmware_free-version/htc_7010.fw -P /lib/firmware

# SciTE configuration:
wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.SciTEUser.properties -P ~/

# Set vim as the default editor:
if [ "`which vim.basic`" ]; then
    sudo update-alternatives --set editor $(which vim.basic)
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
