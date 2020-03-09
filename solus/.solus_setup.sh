#!/bin/sh

# wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/solus/.solus_setup.sh -P ~/ && bash ~/.solus_setup.sh

sudo eopkg upgrade
sudo eopkg install -y -c system.devel
sudo eopkg install -y \
    cloc emacs fuse git keybase linux-lts llvm llvm-clang openssh \
    sdl2-devel sdl2-image-devel sdl2-mixer-devel sdl2-ttf-devel
sudo usermod -aG fuse $(whoami)
sudo snap refresh
sudo snap install sublime-text --classic
sudo snap install sublime-merge --classic

wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.genericLinuxConfig.sh -P ~/ && \
    bash ~/.genericLinuxConfig.sh

if [ "`which plasmashell`" ]; then
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.kdeSetup.sh -P ~/ && \
        bash .kdeSetup.sh
fi
