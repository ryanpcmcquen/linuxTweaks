#!/bin/sh

sudo touch /etc/ld.so.conf.d/steam.conf

sudo sh -c 'echo "/usr/lib32/
/usr/lib/i386-linux-gnu/mesa/" >> /etc/ld.so.conf.d/steam.conf'
sudo ldconfig
