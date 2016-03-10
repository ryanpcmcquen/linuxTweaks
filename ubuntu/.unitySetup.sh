#!/bin/bash
## wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/ubuntu/.unitySetup.sh -P ~/; bash ~/.unitySetup.sh
##

## autohide the dock and set the icons to a smaller, more reasonable size
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-hide-mode 1
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ icon-size 32
## focus follows mouse!
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ click-to-focus false
## 3x3 workspaces
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 3
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 3
## make the keyboard blazingly fast
gsettings set org.gnome.settings-daemon.peripherals.keyboard repeat true
gsettings set org.gnome.settings-daemon.peripherals.keyboard delay 150
gsettings set org.gnome.settings-daemon.peripherals.keyboard repeat-interval 80
## touchpad settings
gsettings set org.gnome.settings-daemon.peripherals.touchpad scroll-method 'two-finger-scrolling'
gsettings set org.gnome.settings-daemon.peripherals.touchpad horiz-scroll-enabled true
gsettings set org.gnome.settings-daemon.peripherals.touchpad tap-to-click false
## show day and date
gsettings set com.canonical.indicator.datetime show-day true
gsettings set com.canonical.indicator.datetime show-date true
## sleep screen after half an hour
gsettings set org.gnome.desktop.session idle-delay 900
## fix gvim so it shows up in unity (seems to be fixed upstream)
#sudo cp /usr/share/app-install/desktop/vim-gui-common\:gvim.desktop /usr/share/applications/
## make gvim take all of gedit's defaults
sudo sed -i.bak 's@gedit@gvim@g' /etc/gnome/defaults.list
