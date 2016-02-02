#!/bin/sh
## wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/slackware/checkmate.sh -P ~/msb/

## run with EXTRA=no to skip 'extra' pkgs
EXTRA=${EXTRA:-yes}
## run with TESTING=yes for testing pkgs
TESTING=${TESTING:-no}
## ensure all packages are built with BUILDALL=yes
BUILDALL=${BUILDALL:-no}
## detect gtk version for mate-themes package
export GTKVERSION=${GTKVERSION:-gtk`find /var/log/packages/ -name gtk\+3* | sort | tail -1 | cut -d/ -f5 | cut -d- -f2 | cut -d. -f1-2`}

## blacklist all msb packages so they are not overwritten/removed
if [ -z "$(grep _msb /etc/slackpkg/blacklist)" ]; then
  echo [0-9]+_msb >> /etc/slackpkg/blacklist
  echo >> /etc/slackpkg/blacklist
fi

sh mate-build-deps.sh
sh mate-build-base.sh

if [ "$EXTRA" = "yes" ] || [ "$BUILDALL" = "yes" ]; then
  sh mate-build-extra.sh
fi

if [ "$TESTING" = "yes" ] || [ "$BUILDALL" = "yes" ]; then
  cd testing
  sh mate-build-testing.sh
  cd
fi

