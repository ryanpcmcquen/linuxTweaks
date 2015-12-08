#!/bin/sh
## sets up ssh stuff, some bash goodies,
## and a vimrc w/ theme, should work on any linux

## curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/genericLinuxConfig.sh | sh


## my ssh key
cd
if [ ! -d ~/.ssh/ ]; then
  git clone https://ryanpcmcquen@bitbucket.org/ryanpcmcquen/.ssh.git
  chmod 700 .ssh/
  chmod 600 .ssh/*
  chmod 644 .ssh/id_rsa.pub
  chmod 644 .ssh/known_hosts
fi

## make ssh less annoying
if [ -z "$(grep 'SSH_AUTH_SOCK' /etc/profile)" ]; then
  sudo echo >> /etc/profile
  sudo echo 'if [ -z "$SSH_AUTH_SOCK" ]; then' >> /etc/profile
  sudo echo '  eval `ssh-agent`' >> /etc/profile
  sudo echo '  ssh-add' >> /etc/profile
  sudo echo 'fi' >> /etc/profile
  sudo echo >> /etc/profile
fi

## start the ssh-agent so we can clone away without
## entering a passphrase several times
if [ -z "$SSH_AUTH_SOCK" ]; then
  eval `ssh-agent`
  ssh-add
fi

## get vimrc, and set up git config
curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/gitVimNORMALorROOT.sh | sh

## set up my vim theme
mkdir -p ~/.vim/colors/
wget -N https://raw.githubusercontent.com/ryanpcmcquen/true-monochrome_vim/master/colors/true-monochrome.vim -P ~/.vim/colors/

if [ -e $HOME/.bashrc ]; then
  if [ -e $HOME/.bash_profile ]; then
    BASHFILE=".bash_profile"
  else
    BASHFILE=".bashrc"
  fi
  if [ -z "`grep 'for DIR in' ${BASHFILE}`" ]; then
    echo >> ~/${BASHFILE}
    echo '## extend path with any /opt/ programs' >> ~/${BASHFILE}
    echo 'for DIR in /opt/*/bin' >> ~/${BASHFILE}
    echo '  do PATH="$DIR:$PATH"' >> ~/${BASHFILE}
    echo 'done' >> ~/${BASHFILE}
    echo >> ~/${BASHFILE}
    echo '## extend path with any /usr/local/ stuff, like heroku' >> ~/${BASHFILE}
    echo 'for DIR in /usr/local/*/bin' >> ~/${BASHFILE}
    echo '  do PATH="$DIR:$PATH"' >> ~/${BASHFILE}
    echo 'done' >> ~/${BASHFILE}
    echo
    echo "Enjoy your new PATH goodies!"
    echo
  else
    echo "You already have the PATH goodies!"
  fi
else
  echo
  echo "You have no .bashrc or .bash_profile, make one like so:"
  echo "  touch ~/.bashrc"
  echo
  exit 1
fi
