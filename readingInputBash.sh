#!/bin/sh

read -r -p "Would you like to go vanilla? [y/N]: " response
case $response in
  [yY][eE][sS]|[yY])
    export VANILLA=true;
    echo You are going vanilla.;
    ;;
  *)
    echo You are not going vanilla.; 
    ;;
esac


read -r -p "Would you like to install Mate? [y/N]: " response
case $response in
  [yY][eE][sS]|[yY])
    export MATE=true;
    echo You have chosen to install Mate.;
    ;;
  *)
    echo You are not installing Mate.;
    ;;
esac

