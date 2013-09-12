#!/bin/bash
# settingsRestoration

mkdir /etc/X11/xorg.conf.d/
cp ~/Dropbox/linuxTweaks/slackTweaks/51-synaptics.conf /etc/X11/xorg.conf.d/51-synaptics.conf
cp ~/Dropbox/linuxTweaks/slackTweaks/slackDrive/lilo.conf /etc/lilo.conf
cp ~/Dropbox/linuxTweaks/slackTweaks/slackDrive/.bashrc ~/.bashrc
cp ~/Dropbox/linuxTweaks/slackTweaks/slackDrive/fstab /etc/fstab

