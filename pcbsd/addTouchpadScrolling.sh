#!/bin/sh
echo 'hw.psm.synaptics_support="1"' >> /boot/loader.conf
grub-mkconfig -o /boot/grub/grub.cfg
