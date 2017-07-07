#!/bin/bash

## wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/trisquel/.trisquel_foo.sh -P ~/; bash ~/.trisquel_foo.sh

ESSENTIALS="build-essential curl wget git vim emacs chromium-browser exuberant-ctags zlib1g-dev libsndfile1-dev libsdl1.2-dev"

sudo add-apt-repository -y ppa:canonical-chromium-builds/stage
sudo apt-get update && sudo apt-get dist-upgrade -y
sudo apt-get autoclean && sudo apt-get clean && sudo apt-get autoremove -y

sudo apt-get install -y $ESSENTIALS

wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.genericLinuxConfig.sh -P ~/
sh ~/.genericLinuxConfig.sh

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

## Haskell!
curl -sSL https://get.haskellstack.org/ | sh
## Reset to haskell-vim-now's settings:
#ln -sf ~/.config/haskell-vim-now/.vimrc ~/
#ln -sf ~/.config/haskell-vim-now/.vim ~/
#curl -L https://git.io/haskell-vim-now > /tmp/haskell-vim-now.sh
#bash /tmp/haskell-vim-now.sh

wget -N https://gist.githubusercontent.com/ryanpcmcquen/655cb3cc60f9d064738903e59504a5fd/raw/installLatestTextadept.sh -P /tmp/
bash /tmp/installLatestTextadept.sh

## Sets up some nice defaults for Mate, including a fast key repeat.
curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.mateSetup.sh | sh
