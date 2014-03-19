#!/bin/sh
## as root

# curl https://raw.github.com/ryanpcmcquen/linuxTweaks/master/bashGitVimROOT.sh | bash

mkdir -p ~/.vim/tmp

wget -N https://raw.github.com/ryanpcmcquen/linuxTweaks/master/slackware/root/.bashrc -P ~/
wget -N https://raw.github.com/ryanpcmcquen/linuxTweaks/master/.gitconfig -P ~/
wget -N https://raw.github.com/ryanpcmcquen/linuxTweaks/master/.vimrc -P ~/

wget -N https://raw.github.com/ryanpcmcquen/linuxTweaks/master/51-synaptics.conf -P /etc/X11/xorg.conf.d/
