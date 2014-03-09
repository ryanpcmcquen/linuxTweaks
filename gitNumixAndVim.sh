#!/bin/sh
## run this as a normal user

sudo wget https://raw.github.com/numixproject/numix/gh-pages/resources/img/bg.png -P /usr/share/wallpapers/;

sudo wget https://raw.github.com/ryanpcmcquen/slackpapers/master/slackware-makepkg-not-war-ryanpc.png -P /usr/share/wallpapers/;
sudo wget https://raw.github.com/ryanpcmcquen/slackpapers/master/Think_Slack.png -P /usr/share/wallpapers/;
sudo wget https://raw.github.com/ryanpcmcquen/slackpapers/master/Think_White_slack.png -P /usr/share/wallpapers/;

sudo wget https://raw.github.com/ryanpcmcquen/googleNowWallpapers/master/seattle2.png -P /usr/share/wallpapers/;

wget https://github.com/ryanpcmcquen/numix-icon-theme-shine/archive/master.zip -P ~/;
sudo unzip ~/master.zip -d /usr/share/icons/; sudo mv /usr/share/icons/numix-icon-theme-shine-master/Numix-Shine/ /usr/share/icons/;
sudo rm -rf /usr/share/icons/numix-icon-theme-shine-master/; rm ~/master.zip;

wget https://github.com/shimmerproject/Numix/archive/master.zip -P ~/;
sudo unzip ~/master.zip -d /usr/share/themes/; rm ~/master.zip;

mkdir -p ~/.vim/tmp/; wget https://raw2.github.com/ryanpcmcquen/linuxTweaks/master/.vimrc -P ~/;
wget https://raw.github.com/ryanpcmcquen/linuxTweaks/master/.gitconfig -P ~/;

su; mkdir -p ~/.vim/tmp; wget https://raw2.github.com/ryanpcmcquen/linuxTweaks/master/.vimrc -P ~/;
wget https://raw.github.com/ryanpcmcquen/linuxTweaks/master/.gitconfig -P ~/

