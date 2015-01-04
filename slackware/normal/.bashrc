
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1='\u@\w:$(parse_git_branch)\$ '
alias reboot='sudo /sbin/reboot'
alias shutdown='sudo /sbin/shutdown -h now'

## check if tmux is running before running it
if [ ! $(ps -e | grep -q tmux) ]; then
  exec tmux -u
  ## makes history work as expected in tmux
  export PROMPT_COMMAND="history -a"
  shopt -s histappend
fi

