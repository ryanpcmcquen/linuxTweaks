#!/bin/sh

## to customize resolution, aspect ratio, et cetera
# wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/games/doom3/autoexec.cfg -P \
# ~/.cxoffice/Steam/drive_c/Program\ Files/Steam/SteamApps/common/Doom\ 3/base/

cd ~/.cxoffice/Steam/drive_c/Program\ Files/Steam/SteamApps/common/Doom\ 3/

primusrun ~/cxoffice/bin/wine --bottle Steam --cx-app Doom3.exe
