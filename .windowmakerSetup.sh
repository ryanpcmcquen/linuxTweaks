#!/bin/sh

## curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.windowmakerSetup.sh | sh

## everyone loves the terminal, says the unix nerd
if [ -z "$(grep 'Mod1+F1' ~/GNUstep/Defaults/WMRootMenu)" ]; then
  sed -i.bak 's@(Konsole, EXEC, konsole)@\
  (Konsole, EXEC, konsole),\
  (uxterm, SHORTCUT, "Mod1+F1", EXEC, "uxterm")\
  @g' ~/GNUstep/Defaults/WMRootMenu
fi

## kind of doing a fluxbox thing here
if [ -z "$(grep 'Mod1+F2' ~/GNUstep/Defaults/WMRootMenu)" ]; then
  sed -i.bak 's@(Run..., SHEXEC, "%A(Run, Type command:)"),@\
  (Run..., SHEXEC, "%A(Run, Type command:)"),\
  (Run..., SHORTCUT, "Mod1+F2", EXEC, "%A(Run, Type command:)"),\
  @g' ~/GNUstep/Defaults/WMRootMenu
fi

## typical alt + f4 close key
sed -i.bak 's/CloseKey = None;/CloseKey = "Mod1+F4";/g' ~/GNUstep/Defaults/WindowMaker

## alt+m is minimize, may as well make alt+n maximize
sed -i.bak 's/MaximizeKey = None;/MaximizeKey = "Mod1+N";/g' ~/GNUstep/Defaults/WindowMaker

