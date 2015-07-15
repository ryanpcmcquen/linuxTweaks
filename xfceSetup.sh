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

## i love terminus!
xfconf-query -c xsettings -p /Gtk/FontName -n -t string -s "Terminus 10"

## we need the terminal quickly!
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Primary><Alt>t" -n -t string -s /usr/bin/xfce4-terminal

## bring back the audio control
xfconf-query -c xfce4-keyboard-shortcuts -p /commands/custom/XF86AudioMute -n -t string -s "amixer set Master toggle; amixer set -c 1 Master toggle"
xfconf-query -c xfce4-keyboard-shortcuts -p /commands/custom/XF86AudioLowerVolume -n -t string -s "amixer set Master 5%- unmute; amixer set -c 1 Master 5%- unmute"
xfconf-query -c xfce4-keyboard-shortcuts -p /commands/custom/XF86AudioRaiseVolume -n -t string -s "amixer set Master 5%+ unmute; amixer set -c 1 Master 5%+ unmute"

## thanks to @bmaupin
## configure keyboard shortcuts for moving windows to different workspaces
xfconf-query -c xfce4-keyboard-shortcuts --create -p "/xfwm4/custom/<Primary><Shift><Alt>Down" -t string -s "move_window_down_workspace_key"
xfconf-query -c xfce4-keyboard-shortcuts --create -p "/xfwm4/custom/<Primary><Shift><Alt>Left" -t string -s "move_window_left_workspace_key"
xfconf-query -c xfce4-keyboard-shortcuts --create -p "/xfwm4/custom/<Primary><Shift><Alt>Right" -t string -s "move_window_right_workspace_key"
xfconf-query -c xfce4-keyboard-shortcuts --create -p "/xfwm4/custom/<Primary><Shift><Alt>Up" -t string -s "move_window_up_workspace_key"

## verify top panel layout, these should be the defaults
xfconf-query -c xfce4-panel -p /plugins/plugin-1 -n -t string -s applicationsmenu
xfconf-query -c xfce4-panel -p /plugins/plugin-2 -n -t string -s tasklist
xfconf-query -c xfce4-panel -p /plugins/plugin-3 -n -t string -s separator
xfconf-query -c xfce4-panel -p /plugins/plugin-4 -n -t string -s pager
xfconf-query -c xfce4-panel -p /plugins/plugin-5 -n -t string -s clock
xfconf-query -c xfce4-panel -p /plugins/plugin-6 -n -t string -s systray
xfconf-query -c xfce4-panel -p /plugins/plugin-7 -n -t string -s actions

## make the top panel beautiful
## applications menu
xfconf-query -c xfce4-panel -p /plugins/plugin-1/show-button-title -n -t bool -s false
## workspace pager,
## i call this the "Theodore Ts'o" layout
xfconf-query -c xfce4-panel -p /plugins/plugin-4/rows -n -t int -s 3
xfconf-query -c xfce4-panel -p /plugins/plugin-4/miniature-view -n -t bool -s true
xfconf-query -c xfwm4 -p /general/workspace_count -n -t int -s 9
## clock (fuzzy mode)
xfconf-query -c xfce4-panel -p /plugins/plugin-5/show-frame -n -t bool -s false
xfconf-query -c xfce4-panel -p /plugins/plugin-5/mode -n -t int -s 3
## systray
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
xfconf-query -c xfce4-session -p /startup/screensaver/enabled -n -t bool -s false

## make the terminal groovier
if [ -z "$(cat ~/.config/xfce4/terminal/terminalrc | grep 'MiscDefaultGeometry\=140x40')" ]; then
  sed -i.bak 's@MiscDefaultGeometry\=.*@MiscDefaultGeometry\=140x40@g' ~/.config/xfce4/terminal/terminalrc
fi
if [ -z "$(cat ~/.config/xfce4/terminal/terminalrc | grep 'FontName\=Terminus\ 9')" ]; then
  sed -i.bak 's@FontName\=.*@FontName\=Terminus\ 9@g' ~/.config/xfce4/terminal/terminalrc
fi

