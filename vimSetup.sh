#!/bin/sh

##  curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/vimSetup.sh | sh

wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.vimrc -P ~/

mkdir -p ~/.vim/colors/
wget -N https://raw.githubusercontent.com/ryanpcmcquen/vim-plain/master/colors/elvis.vim -P ~/.vim/colors/
