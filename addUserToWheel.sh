#!/bin/sh

## if the group does not exist:
# groupadd wheel

usermod -a -G wheel USER_NAME
