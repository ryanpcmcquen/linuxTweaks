#!/bin/bash
## Run as a normal user:
## wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/ubuntu/.ubuntu_LTS_Setup.sh -P ~/; bash ~/.ubuntu_LTS_Setup.sh

## Tested on 14.04 and 16.04.

sudo apt-get update && sudo apt-get dist-upgrade -y

if [ -z "$(grep 'alias apt' ~/.bash_aliases)" ]; then
  echo >> ~/.bash_aliases
  echo "## My aliases:" >> ~/.bash_aliases
  echo "alias aptu='sudo apt-get update && sudo apt-get dist-upgrade -y'" >> ~/.bash_aliases
  echo "alias aptc='sudo apt-get autoclean && sudo apt-get clean && sudo apt-get autoremove -y'" >> ~/.bash_aliases
  echo "alias apti='sudo apt-get install -y '" >> ~/.bash_aliases
fi

if [ -z "$(grep 'xterm-256color' ~/.bashrc)" ]; then
  echo >> ~/.bashrc
  echo 'if [ "$DISPLAY" ]; then' >> ~/.bashrc
  echo '  export TERM=xterm-256color' >> ~/.bashrc
  echo 'fi' >> ~/.bashrc
fi

ESSENTIALPKGS="curl wget git vim vim-gnome emacs build-essential libssl-dev lftp httrack chromium-browser exuberant-ctags python3-pip"

sudo apt-get install -y $ESSENTIALPKGS

## Retrieve git and vim settings:
curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.gitVimNORMALorROOT.sh | sh

if [ `which unity` ]; then
  wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/ubuntu/.unitySetup.sh -P ~/; bash ~/.unitySetup.sh
fi

## Only run Gnome 3 setup if Unity is not installed.
if [ ! `which unity` ] && [ `which gnome-shell` ]; then
  wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.gnome3Setup -P ~/; bash ~/.gnome3Setup
fi

## Configure KDE if present (Kubuntu):
if [ `which startkde` ]; then
  wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.kdeSetup.sh -P ~/; bash ~/.kdeSetup.sh
fi

## Mate!
if [ `which mate-panel` ]; then
  wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.mateSetup.sh -P ~/; bash ~/.mateSetup.sh
fi

## Pantheon (Elementary OS)!
if [ `which pantheon-greeter` ]; then
  gsettings set org.gnome.desktop.peripherals.keyboard repeat true
  gsettings set org.gnome.desktop.peripherals.keyboard repeat 100
  gsettings set org.gnome.desktop.peripherals.keyboard delay 110
fi

## nvm:
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

## Haskell!
curl -sSL https://get.haskellstack.org/ | sh

## Powerline fonts:
powerline_install() {
  cd ~/.powerline-fonts/
  git pull
  ~/.powerline-fonts/install.sh
}

if [ -d ~/.powerline-fonts/ ]; then
  powerline_install
else
  git clone https://github.com/powerline/fonts.git ~/.powerline-fonts/
  powerline_install
fi
cd

## Link back to haskell-vim-now settings in case they were overwritten:
ln -sf ~/.config/haskell-vim-now/.vimrc ~/
ln -sf ~/.config/haskell-vim-now/.vim ~/

## Haskell-vim-now!
curl -L https://git.io/haskell-vim-now > /tmp/haskell-vim-now.sh
bash /tmp/haskell-vim-now.sh

## Set vim as the default editor:
if [ -z "$(grep -r 'EDITOR' /etc/profile.d/ && grep -r 'EDITOR' /etc/profile)" ]; then
  if [ ! -e /etc/profile.d/vimDefault ]; then
    sudo sh -c 'echo >> /etc/profile.d/vimDefault'
    sudo sh -c 'echo "export EDITOR=vim" >> /etc/profile.d/vimDefault'
    sudo sh -c 'echo "export VISUAL=vim" >> /etc/profile.d/vimDefault'
    sudo sh -c 'echo >> /etc/profile.d/vimDefault'
  fi
fi

wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.genericLinuxConfig.sh -P ~/
sh ~/.genericLinuxConfig.sh

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

