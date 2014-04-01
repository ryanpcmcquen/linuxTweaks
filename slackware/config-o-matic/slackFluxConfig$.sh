#!/bin/sh

# curl https://raw.github.com/ryanpcmcquen/linuxTweaks/master/slackware/config-o-matic/slackFluxConfig$.sh | bash

if [ ! $UID != 0 ]; then
cat << EOF

This script must not be run as root.

EOF
  exit 1
fi

curl https://raw.github.com/ryanpcmcquen/linuxTweaks/master/bashGitVimNORMAL.sh | bash
curl https://raw.github.com/ryanpcmcquen/linuxTweaks/master/restoreFluxbox.sh | bash

## numix theme
#wget -N http://box-look.org/CONTENT/content-files/159716-numixpeg.tar.gz -P ~/
#tar xf ~/159716-numixpeg.tar.gz -C ~/.fluxbox/styles
#echo "session.styleFile: /home/ry/.fluxbox/styles/numixpeg" >> ~/.fluxbox/init

## just dark theme
wget -N http://box-look.org/CONTENT/content-files/163116-Just.tgz -P ~/
tar xf ~/163116-Just.tgz -C ~/.fluxbox/styles
echo "session.styleFile: /home/ry/.fluxbox/styles/Just" >> ~/.fluxbox/init
