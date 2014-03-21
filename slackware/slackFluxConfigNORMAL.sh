#!/bin/sh



curl https://raw.github.com/ryanpcmcquen/linuxTweaks/master/bashGitVimNORMAL.sh | bash

curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/restoreFluxbox.sh | bash

wget -N http://box-look.org/CONTENT/content-files/159716-numixpeg.tar.gz -P ~/
tar xf ~/159716-numixpeg.tar.gz -C ~/.fluxbox/styles

echo "session.styleFile:  /home/ry/.fluxbox/styles/numixpeg" >> ~/.fluxbox/init

