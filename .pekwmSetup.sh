#!/bin/sh
## just need a terminal shortcut!

if [ -z "$(grep uxterm ~/.pekwm/keys)" ]; then
  sed -i.bak 's@KeyPress = "Mod4 E" { Actions = "Exec $TERM" }@KeyPress = "Mod4 E" { Actions = "Exec $TERM" } \
  KeyPress = "Mod4 J" { Actions = "Exec uxterm" }@g' ~/.pekwm/keys
fi

