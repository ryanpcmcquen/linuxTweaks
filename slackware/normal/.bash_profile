
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1='\u@\w:$(parse_git_branch)\$ '
alias reboot='sudo /sbin/reboot'
alias shutdown='sudo /sbin/shutdown -h now'

