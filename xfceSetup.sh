#!/bin/sh

xfconf-query -c xfwm4 -p /general/snap_to_border -s true
xfconf-query -c xfwm4 -p /general/snap_to_windows -s true
xfconf-query -c xfwm4 -p /general/wrap_windows -s false

