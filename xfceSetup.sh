#!/bin/sh

xfconf-query -c xfwm4 -p /general/snap_to_border -s true
xfconf-query -c xfwm4 -p /general/snap_to_windows -s true
xfconf-query -c xfwm4 -p /general/wrap_windows -s false
xfconf-query -c xfwm4 -p /general/wrap_workspaces -s false

xfconf-query -c pointers -p /SynPS2_Synaptics_TouchPad/Properties/Synaptics_Edge_Scrolling -t int -s 0 -t int -s 0 -t int -s 0
xfconf-query -c pointers -p /SynPS2_Synaptics_TouchPad/Properties/Synaptics_Tap_Action -t int -s 0 -t int -s 0 -t int -s 0 -t int -s 0 -t int -s 0 -t int -s 0 -t int -s 0
xfconf-query -c pointers -p /SynPS2_Synaptics_TouchPad/Properties/Synaptics_Two-Finger_Scrolling -t int -s 1 -t int -s 1

xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Primary><Alt>t" -n -t string -s /usr/bin/xfce4-terminal

xfconf-query -c xfce4-panel -p /plugins/plugin-1/show-button-title -s false

xfconf-query -c xfce4-session -p /general/SaveOnExit -s false

