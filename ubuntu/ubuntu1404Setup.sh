#!/bin/sh

ESSENTIALPKGS="git vim vim-gnome build-essential zlib1g-dev libsndfile1-dev libsdl1.2-dev"

sudo apt-get install $ESSENTIALPKGS

## retrieve git and vim settings
curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/gitVimNORMALorROOT.sh | sh

if [ `which unity` ]; then
  ## autohide the dock and set the icons to a smaller, more reasonable size
  gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-hide-mode 1
  gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ icon-size 24
  ## focus follows mouse!
  gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ click-to-focus false
  ## 3x3 workspaces
  gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 3
  gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 3
  ## make the keyboard blazingly fast
  gsettings set org.gnome.settings-daemon.peripherals.keyboard repeat true
  gsettings set org.gnome.settings-daemon.peripherals.keyboard delay uint32 150
  gsettings set org.gnome.settings-daemon.peripherals.keyboard repeat-interval uint32 80
  ## show day and date
  gsettings set com.canonical.indicator.datetime show-day true
  gsettings set com.canonical.indicator.datetime show-date true
  ## sleep screen after half an hour
  gsettings set org.gnome.desktop.session idle-delay 1800
fi

