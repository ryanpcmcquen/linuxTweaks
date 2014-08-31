#!/bin/sh
## as normal or root user

# curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/gitVimNORMALorROOT.sh | sh


GITCONF="https://raw2.github.com/ryanpcmcquen/linuxTweaks/master/.gitconfig"
VIMRC="https://raw2.github.com/ryanpcmcquen/linuxTweaks/master/.vimrc"

wget -N $GITCONF -P ~/
wget -N $VIMRC -P ~/

