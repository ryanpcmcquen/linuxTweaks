#!/bin/sh
## run this as normal user

# curl https://raw2.github.com/ryanpcmcquen/linuxTweaks/master/mateSetup.sh | bash

xdg-mime default caja-folder-handler.desktop inode/directory
xdg-mime default caja-folder-handler.desktop application/x-directory

dconf write /org/mate/desktop/peripherals/touchpad/scroll-method 2
dconf write /org/mate/desktop/peripherals/touchpad/horiz-scroll-enabled true
dconf write /org/mate/desktop/peripherals/touchpad/tap-to-click false
dconf write /org/mate/background/show-desktop-icons false
dconf write /org/mate/marco/general/side-by-side-tiling true
dconf write /org/mate/marco/global-keybindings/run-command-terminal "'<Ctrl><Alt>t'"
dconf write /org/mate/power-manager/idle-dim-battery false
dconf write /org/mate/power-manager/backlight-battery-reduce false

## don't work
#dconf write /org/mate/background/picture-filename "'/usr/share/wallpapers/slackware-makepkg-not-war-ryanpc.png'"
