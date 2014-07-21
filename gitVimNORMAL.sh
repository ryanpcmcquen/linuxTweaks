#!/bin/sh
## as a normal user

# curl https://raw2.github.com/ryanpcmcquen/linuxTweaks/master/gitVimNORMAL.sh | sh


GITCONF="https://raw2.github.com/ryanpcmcquen/linuxTweaks/master/.gitconfig"
VIMRC="https://raw2.github.com/ryanpcmcquen/linuxTweaks/master/.vimrc"

wget -N $GITCONF -P ~/
wget -N $VIMRC -P ~/

