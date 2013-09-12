#!/bin/bash
## settingsRestoration

slackpkg install google-chrome

mkdir ~/builds
mkdir ~/builds/google-chrome

wget http://mirrors.slackware.com/slackware/slackware-14.0/extra/google-chrome/google-chrome.SlackBuild
mv ~/google-chrome.SlackBuild ~/builds/google-chrome/google-chrome.SlackBuild

wget http://mirrors.slackware.com/slackware/slackware-14.0/extra/google-chrome/slack-desc
mv ~/slack-desc ~/builds/google-chrome/slack-desc

wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb ~/builds/google-chrome/google-chrome-stable_current_i386.deb

cp ~/Dropbox/linuxTweaks/slackTweaks/51-synaptics.conf /etc/X11/xorg.conf.d/51-synaptics.conf
cp ~/Dropbox/linuxTweaks/slackTweaks/slackDrive/.bashrc32 ~/.bashrc

ln -s ~/Dropbox/subl/32/Sublime\ Text\ 2/sublime_text /sbin/subl
ln -s ~/Dropbox/subl/32/Sublime\ Text\ 2/sublime_text /usr/bin/subl
