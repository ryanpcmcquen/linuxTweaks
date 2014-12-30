#!/bin/sh
## run this as normal user

# curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/mateSetup.sh | sh

xdg-mime default caja-folder-handler.desktop inode/directory
xdg-mime default caja-folder-handler.desktop application/x-directory

gsettings set org.mate.peripherals-touchpad scroll-method 2
gsettings set org.mate.peripherals-touchpad horiz-scroll-enabled true
gsettings set org.mate.peripherals-touchpad tap-to-click false

gsettings set org.mate.Marco.general side-by-side-tiling true
gsettings set org.mate.Marco.general focus-mode "mouse"

gsettings set org.mate.Marco.global-keybindings run-command-terminal "'<Ctrl><Alt>t'"

gsettings set org.mate.power-manager idle-dim-battery false
gsettings set org.mate.power-manager backlight-battery-reduce false

gsettings set org.mate.background show-desktop-icons true

##terminal settings
gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ default-size-columns 140
gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ default-size-rows 40
gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ use-custom-default-size true
gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ scrollback-unlimited true

## solarized?
PALETTE="#070736364242:#D3D301010202:#858599990000:#B5B589890000:#26268B8BD2D2:#D3D336368282:#2A2AA1A19898:#EEEEE8E8D5D5:#00002B2B3636:#CBCB4B4B1616:#58586E6E7575:#65657B7B8383:#838394949696:#6C6C7171C4C4:#9393A1A1A1A1:#FDFDF6F6E3E3"
BG_COLOR="#00002B2B3636"
FG_COLOR="#9999997B8383"

gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ background-color $BG_COLOR
gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ foreground-color $FG_COLOR
gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ palette $PALETTE

gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ use-theme-colors false
gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ bold-color-same-as-fg false

