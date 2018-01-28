#!/bin/sh
# Run this as any user:
# curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.gitVimNORMALorROOT.sh | sh

GITCONF="https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.gitconfig"
VIMRC="https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.vimrc"

wget -N $GITCONF -P ~/
wget -N $VIMRC -P ~/

