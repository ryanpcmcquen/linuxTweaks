#!/bin/sh

# curl https://raw.github.com/ryanpcmcquen/linuxTweaks/master/restoreFluxbox.sh | bash

## uxterm
sed -i 's/^Mod1 F1 :Exec xterm/Mod1 F1 :Exec uxterm -rv -geometry 200x50\
/g' ~/.fluxbox/keys

## fix audio key settings
sed -i 's/^176 :Exec amixer sset Master,0 1+/123 :Exec amixer sset Master,0 1+\
/g' ~/.fluxbox/keys
sed -i 's/^174 :Exec amixer sset Master,0 1-/122 :Exec amixer sset Master,0 1-\
/g' ~/.fluxbox/keys
sed -i 's/^160 :Exec amixer sset Master,0 toggle/121 :Exec amixer sset Master,0 toggle\
/g' ~/.fluxbox/keys

## terminator (thinkpad reso)
#sed -i 's/^Mod1 F1 :Exec xterm/Mod1 F1 :Exec terminator -m/g' ~/.fluxbox/keys

sed -i 's/^# idesk &/superkey-launch \&\
nm-applet \&\
CopyAgent \&\
fbsetbg -l\
/g' ~/.fluxbox/startup


#sed -i 's/^session.screen0.workspaceNames: Workspace 1,Workspace 2,Workspace 3,Workspace 4,/session.screen0.workspaceNames: 1,2,3,4,/g' ~/.fluxbox/init

echo "session.screen0.workspaceNames: 1,2,3,4," >> ~/.fluxbox/init

echo "session.screen0.toolbar.widthPercent: 50" >> ~/.fluxbox/init

echo "session.screen0.workspacewarping:	false" >> ~/.fluxbox/init
