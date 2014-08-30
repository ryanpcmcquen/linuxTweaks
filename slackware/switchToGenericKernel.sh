#!/bin/sh
## run as root

# curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/slackware/switchToGenericKernel.sh | sh

/usr/share/mkinitrd/mkinitrd_command_generator.sh | sh

/usr/share/mkinitrd/mkinitrd_command_generator.sh -l \ >> ~/switchKernel.sh
ls --color=never /boot/vmlinuz-generic-* | tail -1 | sed s_/boot/v_v_g >> ~/switchKernel.sh

sh ~/switchKernel.sh >> /etc/lilo.conf

lilo -v

rm ~/switchKernel.sh
