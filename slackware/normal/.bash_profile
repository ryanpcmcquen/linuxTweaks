
## Added in /etc/profile,
## only here for reference.
###
###export EDITOR=vim
###export VISUAL=vim
###
###alias ls='ls --color=auto'
###
###if [ "$(nproc)" -gt 2 ]; then
###    export MAKEFLAGS=" -j$(expr $(nproc) - 1) "
###else
###    export MAKEFLAGS=" -j1 "
###fi
###
###if [ -z "$SSH_AUTH_SOCK" ]; then
###    eval `ssh-agent`
###    ssh-add
###fi
###

## So i know where i am in repos:
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

#####################################################
####  I LOVE THESE PASTEBIN COMMAND LINE TOOLS!  ####
#####################################################

## For images:
## https://clbin.com/EChRsk.png
## Usage: clbin IMAGENAME(s)
clbin() {
    curl -F "clbin=@$@" https://clbin.com
}

## For text/code:
## http://ix.io/iiQ
## Usage: ix FILENAME(s)
ix() {
    cat "$@" | curl -F 'f:1=<-' ix.io
}

## For text/code:
## http://sprunge.us/cJOa
## Usage: spru FILENAME(s)
spru() {
    cat "$@" | curl -F 'sprunge=<-' http://sprunge.us
}

###############
##  Aliases  ##
###############

alias reboot='sudo /sbin/reboot'
alias shutdown='sudo /sbin/shutdown -h now'

## Fix elvis in tmux.
alias elvis='TERM=xterm elvis'
alias vi='TERM=xterm elvis'
alias ex='TERM=xterm elvis'

## Make .bash_history work in tmux
## across multiple terminals.
shopt -s histappend
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
export PS1='\u@\w:\$(parse_git_branch)\$ '

## Extend path with any /opt/ programs.
for DIR in /opt/*/bin
    do PATH="$DIR:$PATH"
done

## Extend path with any /usr/local/ stuff, like heroku.
for DIR in /usr/local/*/bin
    do PATH="$DIR:$PATH"
done

## Add ~/bin/ to PATH only if it exists, and is not already in `$PATH`.
[ -d $HOME/bin/ ] && [ -z "$(echo $PATH | grep $HOME)" ] && PATH=$HOME/bin:"$PATH"

## This should be in PATH already, right?
PATH=$HOME/.local/bin:"$PATH"
