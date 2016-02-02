#!/bin/sh
## wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/debian/.debian8setup.sh -P ~/; sh ~/.debian8setup.sh
## basically just gnome and git/vim stuff

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

## make the keyboard crazy fast
gsettings set org.gnome.desktop.peripherals.keyboard repeat true
gsettings set org.gnome.desktop.peripherals.keyboard delay 150
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 80
## sensible touchpad defaults [these may already be set, but it cannot hurt]
gsettings set org.gnome.desktop.peripherals.touchpad scroll-method 'two-finger-scrolling'
## apparently this key was removed at some point
#gsettings set org.gnome.desktop.peripherals.touchpad horiz-scroll-enabled true
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click false

## retrieve git and vim settings
curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/gitVimNORMALorROOT.sh | sh
