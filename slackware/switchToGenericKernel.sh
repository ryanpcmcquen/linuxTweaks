#!/bin/sh
## run as root

/usr/share/mkinitrd/mkinitrd_command_generator.sh | sh

/usr/share/mkinitrd/mkinitrd_command_generator.sh -l >> ~/switchKernel.sh
ls --color=never /boot/vmlinuz-generic-* | tail -1 >> ~/switchKernel.sh

~/switchKernel.sh >> /etc/lilo.conf

lilo -v

rm ~/switchKernel.sh
