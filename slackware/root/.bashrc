
## i could check for ~/.bash_profile before sourcing it,
## but i want to know if it is missing
. ~/.bash_profile

## check if $TMUX is set before running it
if [ -z "$TMUX" ]; then
  exec tmux -u
fi

