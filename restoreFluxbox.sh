#!/bin/sh

# curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/restoreFluxbox.sh | bash

## uxterm
#sed -i 's/^Mod1 F1 :Exec xterm/Mod1 F1 :Exec uxterm -rv -geometry 140x40' ~/.fluxbox/keys

## terminator (thinkpad reso)
sed -i 's/^Mod1 F1 :Exec xterm/Mod1 F1 :Exec terminator --geometry 1100x700/g' ~/.fluxbox/keys


sed -i 's/# idesk &/superkey-launch & nm-applet & fbsetbg -l/g' ~/.fluxbox/startup


sed -i 's/^session.screen0.workspaceNames: Workspace 1,Workspace 2,Workspace 3,Workspace 4,/session.screen0.workspaceNames: 1,2,3,4,/g' ~/.fluxbox/init
echo "session.screen0.workspaceNames: 1,2,3,4," >> ~/.fluxbox/init
