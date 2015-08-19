#!/bin/sh
## this used to use dconf, which is a bad idea
gsettings set org.gnome.settings-daemon.peripherals.touchpad scroll-method 'two-finger-scrolling'
gsettings set org.gnome.settings-daemon.peripherals.touchpad horiz-scroll-enabled true
gsettings set org.gnome.settings-daemon.peripherals.touchpad tap-to-click false
