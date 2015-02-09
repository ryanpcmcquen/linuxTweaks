#!/bin/sh

if [ -z "$(cat ~/GNUstep/Defaults/WMRootMenu | grep 'Mod1+F1')" ]; then
  sed -i 's@\(Konsole\,\ EXEC\,\ konsole\)@\
  \(Konsole, EXEC, konsole),\
  (uxterm, SHORTCUT, "Mod1+F1", EXEC, "uxterm")\
  @g' ~/GNUstep/Defaults/WMRootMenu
fi
