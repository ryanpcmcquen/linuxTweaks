#!/bin/sh

wget -N https://raw2.github.com/ryanpcmcquen/linuxTweaks/master/.asoundrc -P ~/

/etc/rc.d/rc.alsa restart

