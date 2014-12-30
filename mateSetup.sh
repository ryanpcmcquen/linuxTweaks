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

## terminal settings
gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ default-size-columns 140
gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ default-size-rows 40
gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ use-custom-default-size true
gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ scrollback-unlimited true

## blatantly stolen from monokai
palette="#494948483E3E:#F9F926267272:#A6A6E2E22E2E:#FDFD97971F1F:#6666D9D9EFEF:#AEAE8181FFFF:#A1A1EFEFE4E4:#F8F8F8F8F2F2:#757571715E5E:#FCFC5C5C9494:#C1C1F1F16161:#FEFEB2B25757:#8D8DE6E6F7F7:#C2C2A1A1FFFF:#BBBBF7F7EFEF:#F8F8F8F8F0F0"
bd_color="#F8F8F8F8F2F2"
fg_color="#F8F8F8F8F2F2"
bg_color="#272728282222"

gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ background-color $bg_color
gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ foreground-color $fg_color
gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ bold-color $bd_color
gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ palette $palette
gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ use-theme-colors false
gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ bold-color-same-as-fg false
gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ font "monospace 9"
gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ cursor-shape ibeam

