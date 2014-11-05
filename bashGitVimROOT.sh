#!/bin/sh
## as root

# curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/bashGitVimROOT.sh | bash

wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/slackware/root/.bashrc -P ~/
wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/slackware/root/.bash_profile -P ~/
wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.gitconfig -P ~/
wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.vimrc -P ~/

### this should be somewhere else:
#wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/51-synaptics.conf -P /etc/X11/xorg.conf.d/
