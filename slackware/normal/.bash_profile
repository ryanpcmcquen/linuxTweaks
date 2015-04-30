
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1='\u@\w:$(parse_git_branch)\$ '
alias reboot='sudo /sbin/reboot'
alias shutdown='sudo /sbin/shutdown -h now'

## usage: spru FILENAME(s)
spru() {
  cat "$@" | curl -F 'sprunge=<-' http://sprunge.us
}

## make .bash_history work in tmux /
## across multiple terminals
shopt -s histappend
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
