#!/bin/sh

# curl https://raw2.github.com/ryanpcmcquen/linuxTweaks/master/restoreFluxbox.sh | bash

## uxterm
#sed -i 's/^Mod1 F1 :Exec xterm/Mod1 F1 :Exec uxterm -rv -geometry 130x30\
#/g' ~/.fluxbox/keys

## lxterminal
sed -i 's/^Mod1 F1 :Exec xterm/Mod1 F1 :Exec lxterminal --geometry=140x40\
/g' ~/.fluxbox/keys

## terminator (maximizing actually works for terminator in fluxbox)
#sed -i 's/^Mod1 F1 :Exec xterm/Mod1 F1 :Exec terminator -m\
#/g' ~/.fluxbox/keys


## fix audio key settings, verify with xev
sed -i 's/^176 :Exec amixer sset Master,0 1+/123 :Exec amixer sset Master,0 1+\
/g' ~/.fluxbox/keys
sed -i 's/^174 :Exec amixer sset Master,0 1-/122 :Exec amixer sset Master,0 1-\
/g' ~/.fluxbox/keys
sed -i 's/^160 :Exec amixer sset Master,0 toggle/121 :Exec amixer sset Master,0 toggle\
/g' ~/.fluxbox/keys


sed -i 's/^# idesk &/#nm-applet \&\
wicd-client -t \&\
superkey-launch \&\
compton \&\
tilda \&\
gkrellm \&\
CopyAgent \&\
fbsetbg -l\
/g' ~/.fluxbox/startup

## dyne theme
wget -N http://box-look.org/CONTENT/content-files/61999-Dyne-fluxbox.tar.gz -P ~/
tar xf ~/61999-Dyne-fluxbox.tar.gz -C ~/.fluxbox/styles


## idempotent, finally!
if [ "$(tail -1 ~/.fluxbox/init)" == "session.configVersion:	13" ]; then
  echo "session.screen0.workspaceNames: 1,2,3,4," >> ~/.fluxbox/init
  echo "session.screen0.toolbar.widthPercent: 50" >> ~/.fluxbox/init
  echo "session.screen0.workspacewarping: false" >> ~/.fluxbox/init
  echo "session.styleFile: /home/ry/.fluxbox/styles/Dyne" >> ~/.fluxbox/init
fi


rm ~/61999-Dyne-fluxbox.tar.gz



### makin' noise
#sed -i 's/^session.screen0.workspaceNames: Workspace 1,Workspace 2,Workspace 3,Workspace 4,/session.screen0.workspaceNames: 1,2,3,4,/g' ~/.fluxbox/init

#sed -i 's_\
#session.menuFile: ~/.fluxbox/menu\
#session.keyFile: ~/.fluxbox/keys\
#_session.menuFile: ~/.fluxbox/menu\
#session.keyFile: ~/.fluxbox/keys\
#session.screen0.workspaceNames: 1,2,3,4,\

