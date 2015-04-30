
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

## usage: spru FILENAME(s)
spru() {
  cat "$@" | curl -F 'sprunge=<-' http://sprunge.us
}

## save a lot of typing for updates
slu() {
  slackpkg update gpg && \
  slackpkg update && \
  slackpkg install-new && \
  slackpkg upgrade-all && \
  slackpkg clean-system
}

LFS=/mnt/lfs

## make .bash_history work in tmux /
## across multiple terminals
shopt -s histappend
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
export PS1='\u@\w:$(parse_git_branch)\$ '

