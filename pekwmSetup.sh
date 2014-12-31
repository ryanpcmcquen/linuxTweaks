#!/bin/sh
## just need a terminal shortcut!

sed -i 's@KeyPress = "Mod4 E" { Actions = "Exec $TERM" }@KeyPress = "Mod4 E" { Actions = "Exec $TERM" } \
  KeyPress = "Mod4 J" { Actions = "Exec uxterm" }@g' ~/.pekwm/keys

