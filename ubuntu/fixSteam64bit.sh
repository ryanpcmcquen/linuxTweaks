#!/bin/sh

sudo echo "/usr/lib32/ \
/usr/lib/i386-linux-gnu/mesa/" >> /etc/ld.so.conf.d/steam.conf
sudo ldconfig
