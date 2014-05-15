#!/bin/sh
## run this as normal user

# curl https://raw2.github.com/ryanpcmcquen/linuxTweaks/master/mateSetup.sh | sh

xdg-mime default caja-folder-handler.desktop inode/directory
xdg-mime default caja-folder-handler.desktop application/x-directory

gsettings set org.mate.peripherals-touchpad scroll-method 2
gsettings set org.mate.peripherals-touchpad horiz-scroll-enabled true
gsettings set org.mate.peripherals-touchpad tap-to-click false

gsettings set org.mate.background show-desktop-icons false

gsettings set org.mate.Marco.general side-by-side-tiling true

gsettings set org.mate.Marco.global-keybindings run-command-terminal "'<Ctrl><Alt>t'"

gsettings set org.mate.power-manager idle-dim-battery false
gsettings set org.mate.power-manager backlight-battery-reduce false




#dconf write /org/mate/desktop/peripherals/touchpad/scroll-method 2
#dconf write /org/mate/desktop/peripherals/touchpad/horiz-scroll-enabled true
#dconf write /org/mate/desktop/peripherals/touchpad/tap-to-click false

#dconf write /org/mate/background/show-desktop-icons false

#dconf write /org/mate/marco/general/side-by-side-tiling true

#dconf write /org/mate/marco/global-keybindings/run-command-terminal "'<Ctrl><Alt>t'"

#dconf write /org/mate/power-manager/idle-dim-battery false
#dconf write /org/mate/power-manager/backlight-battery-reduce false
