#!/bin/sh

#  curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/xfceSetup.sh | sh

## make window management awesome
xfconf-query -c xfwm4 -p /general/snap_to_border -n -t bool -s true
xfconf-query -c xfwm4 -p /general/snap_to_windows -n -t bool -s true
xfconf-query -c xfwm4 -p /general/wrap_windows -n -t bool -s false
xfconf-query -c xfwm4 -p /general/wrap_workspaces -n -t bool -s false
xfconf-query -c xfwm4 -p /general/click_to_focus -n -t bool -s false

## make touchpad awesome
xfconf-query -c pointers -p /SynPS2_Synaptics_TouchPad/Properties/Synaptics_Edge_Scrolling -n -t int -s 0 -t int -s 0 -t int -s 0
xfconf-query -c pointers -p /SynPS2_Synaptics_TouchPad/Properties/Synaptics_Tap_Action -n -t int -s 0 -t int -s 0 -t int -s 0 -t int -s 0 -t int -s 0 -t int -s 0 -t int -s 0
xfconf-query -c pointers -p /SynPS2_Synaptics_TouchPad/Properties/Synaptics_Two-Finger_Scrolling -n -t int -s 1 -t int -s 1

## enable font anti-aliasing
xfconf-query -c xsettings -p /Xft/Antialias -n -t int -s 1

## we need the terminal quickly!
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Primary><Alt>t" -n -t string -s /usr/bin/xfce4-terminal

## make the top panel beautiful
xfconf-query -c xfce4-panel -p /plugins/plugin-1/show-button-title -n -t bool -s false
xfconf-query -c xfce4-panel -p /plugins/plugin-5/show-frame -n -t bool -s false
xfconf-query -c xfce4-panel -p /plugins/plugin-5/mode -n -t int -s 3
xfconf-query -c xfce4-panel -p /plugins/plugin-6/show-frame -n -t bool -s false

## make the desktop tidy
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-filesystem -n -t bool -s false
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-home -n -t bool -s false
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-trash -n -t bool -s false

## remove annoying defaults
xfconf-query -c xfce4-session -p /general/SaveOnExit -n -t bool -s false
xfconf-query -c xfce4-session -p /splash/Engine -n -t string -s mice

## ooh, the power!
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/lid-action-on-ac -n -t int -s 1
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/lid-action-on-battery -n -t int -s 1

## disable screensaver
xfconf-query -c xfce4-session -n -t bool -p /startup/screensaver/enabled -s false

