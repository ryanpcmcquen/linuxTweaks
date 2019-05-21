#!/bin/bash
##
## wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/ubuntu/.unitySetup.sh -P ~/; bash ~/.unitySetup.sh
##

wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.__KEY_REPEAT_SETTINGS__ -P ~/
. ~/.__KEY_REPEAT_SETTINGS__

## Autohide the dock and set the icons to a smaller, more reasonable size:
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-hide-mode 1
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ icon-size 32
## Focus follows mouse!
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ click-to-focus false
## 3x3 workspaces:
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 3
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 3
## Make the keyboard blazingly fast (old versions):
gsettings set org.gnome.settings-daemon.peripherals.keyboard repeat true
gsettings set org.gnome.settings-daemon.peripherals.keyboard delay ${KEY_REPEAT_DELAY}
gsettings set org.gnome.settings-daemon.peripherals.keyboard repeat-interval ${KEY_REPEAT_RATE}
## Make the keyboard blazingly fast (new versions):
gsettings set org.gnome.desktop.peripherals.keyboard repeat true
gsettings set org.gnome.desktop.peripherals.keyboard delay ${KEY_REPEAT_DELAY}
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval ${KEY_REPEAT_RATE}
## Touchpad settings (old versions):
gsettings set org.gnome.settings-daemon.peripherals.touchpad scroll-method 'two-finger-scrolling'
gsettings set org.gnome.settings-daemon.peripherals.touchpad horiz-scroll-enabled true
gsettings set org.gnome.settings-daemon.peripherals.touchpad tap-to-click false
## Touchpad settings (new versions):
gsettings set org.gnome.desktop.peripherals.touchpad scroll-method 'two-finger-scrolling'
gsettings set org.gnome.desktop.peripherals.touchpad horiz-scroll-enabled true
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click false
## Show day and date:
gsettings set com.canonical.indicator.datetime show-day true
gsettings set com.canonical.indicator.datetime show-date true
## Sleep screen after half an hour:
gsettings set org.gnome.desktop.session idle-delay 900
## Fix gvim so it shows up in unity (seems to be fixed upstream).
#sudo cp /usr/share/app-install/desktop/vim-gui-common\:gvim.desktop /usr/share/applications/
## Make gvim take all of gedit's defaults:
#sudo sed -i.bak 's@gedit@gvim@g' /etc/gnome/defaults.list
