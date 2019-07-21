#!/bin/bash
# wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/debian/.debianSetup.sh -P ~/ && bash ~/.debianSetup.sh
# Basically just Gnome and Git/Vim/Emacs stuff.
# Make sure your user has `sudo` rights!

# Check if user is part of group `sudo`, otherwise just exit.
if [ "`groups ${USER} | grep sudo`" ]; then
    # Get list of packages to install:
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/debian/._SWEETPKGS_ -P ~/
    . ~/._SWEETPKGS_

    sudo apt-get update && sudo apt-get dist-upgrade -y
    sudo apt-get install -y --allow-change-held-packages ${SWEETPKGS}

    # Gnome 3 setup!
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

    # Allow remote extensions to run in Chromium.
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/chromium/enable-remote-extensions -P /etc/chromium.d/

    # Imgult!
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/image-ultimator/master/imgult \
        && sudo install -m755 imgult /usr/local/bin/ \
        && rm imgult

    # Killr!
    wget -N https://gist.githubusercontent.com/ryanpcmcquen/7f6b8e1d4f9af71070a0ec59576d4d5b/raw/killr -P ~/ \
        && sudo install -m755 ~/killr /usr/local/bin/ \
        && rm ~/killr

    # Local password generator:
    wget -N https://gist.githubusercontent.com/ryanpcmcquen/a57201e1c8cb31bda6bce9104092725a/raw/password -P ~/ \
        && chmod +x ~/password

    # SciTE configuration:
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.SciTEUser.properties -P ~/

    wget -N https://gist.githubusercontent.com/ryanpcmcquen/655cb3cc60f9d064738903e59504a5fd/raw/.installLatestTextadept.sh -P ~/

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

    # Set vim as the default editor:
    if [ -z "$(grep -r 'EDITOR' /etc/profile.d/ && grep -r 'EDITOR' /etc/profile)" ]; then
        if [ ! -e /etc/profile.d/vimDefault ]; then
            sudo sh -c 'echo >> /etc/profile.d/vimDefault'
            sudo sh -c 'echo "export EDITOR=vim" >> /etc/profile.d/vimDefault'
            sudo sh -c 'echo "export VISUAL=vim" >> /etc/profile.d/vimDefault'
            sudo sh -c 'echo >> /etc/profile.d/vimDefault'
        fi
    fi
    if [ "`which vim.basic`" ]; then
        sudo update-alternatives --set editor $(which vim.basic)
    fi

    # Add 'Chromebook' keyboard layout.
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.add_chromebook_keyboard_layout.sh -P ~/
    sudo bash ~/.add_chromebook_keyboard_layout.sh

    # Fix headphone audio:
    #sudo wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/alsa-base.conf -P /etc/modprobe.d/

    # Libre wireless dongle drivers:
    sudo wget -N https://www.thinkpenguin.com/files/ath9k_firmware_free-version/htc_9271.fw -P /lib/firmware
    sudo wget -N https://www.thinkpenguin.com/files/ath9k_firmware_free-version/htc_7010.fw -P /lib/firmware

    # Set up ssh, Vim, Emacs and more.
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.genericLinuxConfig.sh -P ~/; sh ~/.genericLinuxConfig.sh
else
    echo "Your user needs `sudo` permissions!"
    exit 1
fi
