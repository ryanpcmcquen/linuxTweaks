#!/bin/bash
## run as a normal user:
## wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/ubuntu/.ubuntu1404Setup.sh -P ~/; bash ~/.ubuntu1404Setup.sh

sudo apt-get update && sudo apt-get dist-upgrade -y

if [ -z "$(cat ~/.bash_aliases | grep 'alias apt')" ]; then
  echo "## my aliases" >> ~/.bash_aliases
  echo "alias aptu='sudo apt-get update && sudo apt-get dist-upgrade -y'" >> ~/.bash_aliases
  echo "alias aptc='sudo apt-get autoclean && sudo apt-get clean && sudo apt-get autoremove -y'" >> ~/.bash_aliases
  echo "alias apti='sudo apt-get install -y '" >> ~/.bash_aliases
fi

ESSENTIALPKGS="git vim vim-gnome build-essential zlib1g-dev libsndfile1-dev libsdl1.2-dev"

sudo apt-get install -y $ESSENTIALPKGS

## properly add google chrome repo, and install the beta
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
## check for this so we don't keep adding the same line on re-runs
if [ -z "$(find /etc/apt/sources.list.d/ -name 'google-*')" ]; then
  sudo wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/ubuntu/google-chrome-beta.list -P /etc/apt/sources.list.d/
fi
sudo apt-get update
sudo apt-get install -y google-chrome-beta

## retrieve git and vim settings
curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/gitVimNORMALorROOT.sh | sh

if [ `which unity` ]; then
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
fi

## set vim as the default editor
if [ -z "$(grep -r 'EDITOR' /etc/profile.d/ && grep -r 'EDITOR' /etc/profile)" ]; then
  if [ ! -e /etc/profile.d/vimDefault ]; then
    sudo sh -c 'echo >> /etc/profile.d/vimDefault'
    sudo sh -c 'echo "export EDITOR=vim" >> /etc/profile.d/vimDefault'
    sudo sh -c 'echo "export VISUAL=vim" >> /etc/profile.d/vimDefault'
    sudo sh -c 'echo >> /etc/profile.d/vimDefault'
  fi
fi

## restart unity so all our settings take effect
##if [ "$(pgrep unity)" ]; then
  ##unity --replace
##fi

echo
echo "    .--. "
echo "   |o_o | "
echo "   |:_/ | "
echo "  //   \ \ "
echo " (|     | ) "
echo "/'\_   _/'\ "
echo "\___)=(___/ "
echo
echo "A reboot may be necessary."
echo

