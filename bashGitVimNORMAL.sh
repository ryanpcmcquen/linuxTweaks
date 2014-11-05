#!/bin/sh
## as a normal user

# curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/bashGitVimNORMAL.sh | bash

BASHRC="https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/slackware/normal/.bashrc"
BASHPR="https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/slackware/normal/.bash_profile"
GITCONF="https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.gitconfig"
VIMRC="https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.vimrc"



wget -N $BASHRC -P ~/
wget -N $BASHPR -P ~/
wget -N $GITCONF -P ~/
wget -N $VIMRC -P ~/

