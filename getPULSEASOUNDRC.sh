#!/bin/sh

wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/pulseaudio/.asoundrc -P ~/
. ~/.asoundrc
start-pulseaudio-x11

