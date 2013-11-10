## For the case of bash specifically I can disable this by running:

echo 'set bell-style none' >> ~/.inputrc

#!/bin/sh

## To remove all console beeps whilst running X you should execute:

xset b off

##This disables the console beep for all programs.


##To remove all console beeps whilst running from the system console execute:

setterm -blength 0

## This disables the console beep for all programs, by setting the "beep length" to zero.

## source: http://www.debian-administration.org/articles/110

## as root:
rmmod pcspkr
