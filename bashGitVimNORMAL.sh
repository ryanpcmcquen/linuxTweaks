#!/bin/sh
## as a normal user

# curl https://raw.github.com/ryanpcmcquen/linuxTweaks/master/bashGitVimNORMAL.sh | bash

$BASHRC="https://raw.github.com/ryanpcmcquen/linuxTweaks/master/slackware/normal/.bashrc"
$BASHPR="https://raw.github.com/ryanpcmcquen/linuxTweaks/master/slackware/normal/.bash_profile"
$GITCONF="https://raw.github.com/ryanpcmcquen/linuxTweaks/master/.gitconfig"
$VIMRC="https://raw.github.com/ryanpcmcquen/linuxTweaks/master/.vimrc"

mkdir -p ~/.vim/tmp

wget -N $BASHRC -P ~/
wget -N $BASHPR -P ~/
wget -N $GITCONF -P ~/
wget -N $VIMRC -P ~/

