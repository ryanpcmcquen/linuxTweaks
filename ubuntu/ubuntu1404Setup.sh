#!/bin/sh

ESSENTIALPKGS="git vim vim-gtk build-essential zlib1g-dev libsndfile1-dev libsdl1.2-dev"

sudo apt-get install $ESSENTIALPKGS

## retrieve git and vim settings
curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/gitVimNORMALorROOT.sh | sh
