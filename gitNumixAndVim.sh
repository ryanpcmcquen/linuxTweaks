#!/bin/sh
## run this as a normal user

# curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/gitNumixAndVim.sh | bash

sudo wget -N https://raw.githubusercontent.com/numixproject/numix/gh-pages/resources/img/bg.png -P /usr/share/wallpapers/;

sudo wget -N https://raw.githubusercontent.com/ryanpcmcquen/slackpapers/master/slackware-makepkg-not-war-ryanpc.png -P /usr/share/wallpapers/;
sudo wget -N https://raw.githubusercontent.com/ryanpcmcquen/slackpapers/master/Think_Slack.png -P /usr/share/wallpapers/;
sudo wget -N https://raw.githubusercontent.com/ryanpcmcquen/slackpapers/master/Think_White_slack.png -P /usr/share/wallpapers/;

sudo wget -N https://raw.githubusercontent.com/ryanpcmcquen/googleNowWallpapers/master/seattle2.png -P /usr/share/wallpapers/;

## doesn't work
#sudo wget -N https://github.com/numixproject/numix-icon-theme-shine/archive/master.zip -P ~/;
#sudo unzip -o ~/master.zip -d /usr/share/icons/;
#sudo mv /usr/share/icons/numix-icon-theme-shine-master/Numix-Shine/ /usr/share/icons/;
#sudo rm -rf /usr/share/icons/numix-icon-theme-shine-master/;
#sudo rm ~/master.zip;

#sudo wget -N https://github.com/shimmerproject/Numix/archive/master.zip -P ~/;
#sudo unzip -o ~/master.zip -d /usr/share/themes/;
#sudo rm ~/master.zip;

#mkdir -p ~/.vim/tmp/;
wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.vimrc -P ~/;
wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.gitconfig -P ~/;

sudo -s <<EOF;
wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.vimrc -P /root/;
wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.gitconfig -P /root/;
exit;
EOF

#sudo -s <<EOF;
#mkdir -p /root/.vim/tmp/;
#wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.vimrc -P /root/;
#wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.gitconfig -P /root/;
#exit;
#EOF
