#!/bin/sh

wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/pulseaudio/.asoundrc -P ~/
/etc/rc.d/rc.alsa restart
start-pulseaudio-x11

