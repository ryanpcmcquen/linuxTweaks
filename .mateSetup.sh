#!/bin/sh
## run this as normal user

## curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.mateSetup.sh | sh

wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.__KEY_REPEAT_SETTINGS__ -P ~/
. ~/.__KEY_REPEAT_SETTINGS__

## Make caja open stuff:
if [ -d ~/.local/share/applications/ ]; then
    xdg-mime default caja-folder-handler.desktop inode/directory
    xdg-mime default caja-folder-handler.desktop application/x-directory
fi

## These should be defaults, but who am I?
gsettings set org.mate.peripherals-touchpad scroll-method 2
gsettings set org.mate.peripherals-touchpad horiz-scroll-enabled true
gsettings set org.mate.peripherals-touchpad tap-to-click false

## This makes you look cool:
gsettings set org.mate.peripherals-keyboard delay ${KEY_REPEAT_DELAY}
gsettings set org.mate.peripherals-keyboard rate ${KEY_REPEAT_RATE}

gsettings set org.mate.Marco.general side-by-side-tiling true

## Focus follows mouse!
# gsettings set org.mate.Marco.general focus-mode "mouse"

## All slackers need quick terminal access.
gsettings set org.mate.Marco.global-keybindings run-command-terminal "'<Ctrl><Alt>t'"

## Needless dimming is needless.
gsettings set org.mate.power-manager idle-dim-battery false
gsettings set org.mate.power-manager backlight-battery-reduce false

## Old school, set to false to keep it tidy:
gsettings set org.mate.background show-desktop-icons true

## Set up pluma to be even nicer:
gsettings set org.mate.pluma auto-indent true
gsettings set org.mate.pluma bracket-matching true
gsettings set org.mate.pluma display-line-numbers false
gsettings set org.mate.pluma display-right-margin true
gsettings set org.mate.pluma highlight-current-line false
#gsettings set org.mate.pluma editor-font "Monospace 10"
gsettings set org.mate.pluma insert-spaces true
gsettings set org.mate.pluma tabs-size 4

## Terminal settings:
gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ default-size-columns 110
gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ default-size-rows 30
gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ use-custom-default-size true
gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ scrollback-unlimited true

# ## Blatantly stolen from monokai:
# PALETTE="#494948483E3E:#F9F926267272:#A6A6E2E22E2E:#FDFD97971F1F:#6666D9D9EFEF:#AEAE8181FFFF:#A1A1EFEFE4E4:#F8F8F8F8F2F2:#757571715E5E:#FCFC5C5C9494:#C1C1F1F16161:#FEFEB2B25757:#8D8DE6E6F7F7:#C2C2A1A1FFFF:#BBBBF7F7EFEF:#F8F8F8F8F0F0"
# BD_COLOR="#F8F8F8F8F2F2"
# FG_COLOR="#F8F8F8F8F2F2"
# BG_COLOR="#272728282222"

# ## Makin' it beautiful:
# gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ background-color $BG_COLOR
# gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ foreground-color $FG_COLOR
# gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ bold-color $BD_COLOR
# gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ palette $PALETTE
# gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ use-theme-colors false
# gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ bold-color-same-as-fg false
# gsettings set org.mate.terminal.profile:/org/mate/terminal/profiles/default/ cursor-shape ibeam
