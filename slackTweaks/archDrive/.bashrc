#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias pmu='sudo pacman -Syyu && sudo /mnt/hd/sbin/lilo -v'
alias pmi='sudo pacman -S'
alias pku='sudo packer -Syyu'
alias pki='sudo packer -S'

alias ls='ls --color=auto'

PS1='[\u@\h \W]\$ '
