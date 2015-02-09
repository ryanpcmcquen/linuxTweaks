#!/bin/sh

## curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/windowmakerSetup.sh | sh

## everyone loves the terminal, says the unix nerd
if [ -z "$(cat ~/GNUstep/Defaults/WMRootMenu | grep 'Mod1+F1')" ]; then
  sed -i 's@(Konsole, EXEC, konsole)@\
  (Konsole, EXEC, konsole),\
  (uxterm, SHORTCUT, "Mod1+F1", EXEC, "uxterm")\
  @g' ~/GNUstep/Defaults/WMRootMenu
fi

## kind of doing a fluxbox thing here
if [ -z "$(cat ~/GNUstep/Defaults/WMRootMenu | grep 'Mod1+F2')" ]; then
  sed -i 's@(Run..., SHEXEC, "%A(Run, Type command:)"),@\
  (Run..., SHEXEC, "%A(Run, Type command:)"),\
  (Run..., SHORTCUT, "Mod1+F2", EXEC, "%A(Run, Type command:)"),\
  @g' ~/GNUstep/Defaults/WMRootMenu
fi

## typical alt + f4 close key
sed -i 's/CloseKey = None;/CloseKey = "Mod1+F4";/g' ~/GNUstep/Defaults/WindowMaker

## alt+m is minimize, may as well make alt+n maximize
sed -i 's/MaximizeKey = None;/MaximizeKey = "Mod1+N";/g' ~/GNUstep/Defaults/WindowMaker

