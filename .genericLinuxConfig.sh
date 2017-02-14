#!/bin/sh
## Sets up ssh stuff, some bash goodies,
## and a vimrc, should work on any linux distro.
## Also Emacs.

## wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.genericLinuxConfig.sh -P ~/; sh ~/.genericLinuxConfig.sh


## My ssh key:
cd
if [ ! -d ~/.ssh/ ]; then
  git clone https://ryanpcmcquen@bitbucket.org/ryanpcmcquen/.ssh.git
  chmod 700 .ssh/
  chmod 600 .ssh/*
  chmod 644 .ssh/id_rsa.pub
  chmod 644 .ssh/known_hosts
fi

## Copy this version if you do not have sudo:
##echo >> /etc/profile.d/START_SSH_AGENT; echo 'if [ -z "$SSH_AUTH_SOCK" ]; then' >> /etc/profile.d/START_SSH_AGENT; echo '  eval `ssh-agent`' >> /etc/profile.d/START_SSH_AGENT; echo '  ssh-add' >> /etc/profile.d/START_SSH_AGENT; echo 'fi' >> /etc/profile.d/START_SSH_AGENT; echo >> /etc/profile.d/START_SSH_AGENT

## Start the ssh-agent so we can clone away without
## entering a passphrase several times:
if [ -z "$SSH_AUTH_SOCK" ]; then
  eval `ssh-agent`
  ssh-add
fi

## Get vimrc, and set up git config:
curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.gitVimNORMALorROOT.sh | sh

## Emacs!
wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.emacs -P ~/

if [ -e $HOME/.bashrc ]; then
  if [ -e $HOME/.bash_profile ]; then
    BASHFILE=".bash_profile"
  else
    BASHFILE=".bashrc"
  fi
  ## Make ssh less annoying:
  if [ -z "$(grep 'SSH_AUTH_SOCK' ${BASHFILE})" ]; then
    echo >> ~/${BASHFILE}
    echo 'if [ -z "$SSH_AUTH_SOCK" ]; then' >> ~/${BASHFILE}
    echo '  eval `ssh-agent`' >> ~/${BASHFILE}
    echo '  ssh-add' >> ~/${BASHFILE}
    echo 'fi' >> ~/${BASHFILE}
    echo >> ~/${BASHFILE}
  fi
  if [ -z "`grep 'for DIR in' ${BASHFILE}`" ]; then
    echo >> ~/${BASHFILE}
    echo '## Extend path with any /opt/ programs:' >> ~/${BASHFILE}
    echo 'for DIR in /opt/*/bin' >> ~/${BASHFILE}
    echo '  do PATH="$DIR:$PATH"' >> ~/${BASHFILE}
    echo 'done' >> ~/${BASHFILE}
    echo >> ~/${BASHFILE}
    echo '## Extend path with any /usr/local/ stuff, like Heroku:' >> ~/${BASHFILE}
    echo 'for DIR in /usr/local/*/bin' >> ~/${BASHFILE}
    echo '  do PATH="$DIR:$PATH"' >> ~/${BASHFILE}
    echo 'done' >> ~/${BASHFILE}
    echo >> ~/${BASHFILE}
    echo '## Add ~/bin/ to PATH only if it exists, and is not already in $PATH:' >> ~/${BASHFILE}
    echo '[ -d $HOME/bin/ ] && [ -z "$(echo $PATH | grep $HOME)" ] && PATH=$HOME/bin:"$PATH"' >> ~/${BASHFILE}
    echo >> ~/${BASHFILE}
    echo
    echo "Enjoy your new PATH goodies!"
    echo
  else
    echo
    echo "You already have the PATH goodies!"
    echo
  fi
else
  echo
  echo "You have no .bashrc or .bash_profile, make one like so:"
  echo "  touch ~/.bashrc"
  echo
  exit 1
fi
