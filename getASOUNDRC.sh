#!/bin/sh

wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.asoundrc -P ~/

/etc/rc.d/rc.alsa restart

