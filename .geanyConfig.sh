#!/bin/sh
## 2 spaces!

sed -i.bak 's/use_tab_to_indent=.*/use_tab_to_indent=false/g' ~/.config/geany/geany.conf
sed -i.bak 's/indent_type=.*/indent_type=0/g' ~/.config/geany/geany.conf
sed -i.bak 's/pref_editor_tab_width=.*/pref_editor_tab_width=2/g' ~/.config/geany/geany.conf
