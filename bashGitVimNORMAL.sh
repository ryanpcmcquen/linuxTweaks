#!/bin/sh
## as a normal user

# curl https://raw2.github.com/ryanpcmcquen/linuxTweaks/master/bashGitVimNORMAL.sh | bash

BASHRC="https://raw2.github.com/ryanpcmcquen/linuxTweaks/master/slackware/normal/.bashrc"
BASHPR="https://raw2.github.com/ryanpcmcquen/linuxTweaks/master/slackware/normal/.bash_profile"
GITCONF="https://raw2.github.com/ryanpcmcquen/linuxTweaks/master/.gitconfig"
VIMRC="https://raw2.github.com/ryanpcmcquen/linuxTweaks/master/.vimrc"



wget -N $BASHRC -P ~/
wget -N $BASHPR -P ~/
wget -N $GITCONF -P ~/
wget -N $VIMRC -P ~/

