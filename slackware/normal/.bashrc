
## get all the goodies there
. ~/.bash_profile

## check if tmux is running before running it
if [ -n "$TMUX" ]; then
  exec tmux -u && export PROMPT_COMMAND="history -a" && shopt -s histappend
fi

