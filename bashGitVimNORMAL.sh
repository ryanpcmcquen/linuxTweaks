#!/bin/sh
## as a normal user

# curl https://raw.github.com/ryanpcmcquen/linuxTweaks/master/bashGitVimNORMAL.sh | bash

mkdir -p ~/.vim/tmp

wget -N https://raw.github.com/ryanpcmcquen/linuxTweaks/master/slackware/normal/.bashrc -P ~/
wget -N https://raw.github.com/ryanpcmcquen/linuxTweaks/master/slackware/normal/.bash_profile -P ~/
wget -N https://raw.github.com/ryanpcmcquen/linuxTweaks/master/.gitconfig -P ~/
wget -N https://raw.github.com/ryanpcmcquen/linuxTweaks/master/.vimrc -P ~/

