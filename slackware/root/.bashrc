
. ~/.bash_profile

## check if $TMUX is set before running it
if [ -n "$TMUX" ]; then
  exec tmux -u && export PROMPT_COMMAND="history -a" && shopt -s histappend
fi

