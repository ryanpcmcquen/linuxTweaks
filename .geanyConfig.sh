#!/bin/sh
## 4 spaces!

sed -i.bak 's/indent_type=.*/indent_type=0/g' ~/.config/geany/geany.conf
sed -i.bak 's/pref_editor_tab_width=.*/pref_editor_tab_width=4/g' ~/.config/geany/geany.conf
