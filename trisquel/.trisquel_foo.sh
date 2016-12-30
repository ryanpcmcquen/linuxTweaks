#!/bin/sh

## wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/trisquel/.trisquel_foo.sh -P ~/; bash ~/.trisquel_foo.sh

ESSENTIALS="build-essential curl git wget"
## Add this one when it shows up in the repo:
## libsdl1.2-dev

sudo apt-get update && sudo apt-get dist-upgrade -y
sudo apt-get autoclean && sudo apt-get clean && sudo apt-get autoremove -y

sudo apt-get install $ESSENTIALS

wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.genericLinuxConfig.sh -P ~/
sh ~/.genericLinuxConfig.sh

## Haskell!
curl -sSL https://get.haskellstack.org/ | sh
## Reset to haskell-vim-now's settings:
ln -sf ~/.config/haskell-vim-now/.vimrc ~/
ln -sf ~/.config/haskell-vim-now/.vim ~/
curl -L https://git.io/haskell-vim-now > /tmp/haskell-vim-now.sh
bash /tmp/haskell-vim-now.sh

wget -N https://gist.githubusercontent.com/ryanpcmcquen/655cb3cc60f9d064738903e59504a5fd/raw/installLatestTextadept.sh -P /tmp/
bash /tmp/installLatestTextadept.sh
