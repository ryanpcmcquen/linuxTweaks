#!/bin/sh

## uxterm
#sed -i 's/^Mod1 F1 :Exec xterm/Mod1 F1 :Exec uxterm -rv -geometry 140x40' ~/.fluxbox/keys

## terminator
sed -i 's/^Mod1 F1 :Exec xterm/Mod1 F1 :Exec terminator --geometry 1100x700/g' ~/.fluxbox/keys


sed -i 's/^#idesk &/superkey-launch & nm-applet & fbsetbg -l/g' ~/.fluxbox/startup
