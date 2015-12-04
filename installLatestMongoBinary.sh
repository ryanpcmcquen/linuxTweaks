#!/bin/sh
## grabs the latest mongo binary version,
## because compiling mongo takes a lifetime
if [ `getconf LONG_BIT` = "32" ]; then
  MONGOARCH=x86
elif [ `getconf LONG_BIT` = "64" ]; then
  MONGOARCH=x86_64
else
  echo "Your architecture is not supported."
  exit 1
fi

wget -N https://fastdl.mongodb.org/linux/mongodb-linux-${MONGOARCH}-latest.tgz -P /tmp/
sudo tar xvf /tmp/mongodb-linux-${MONGOARCH}-latest.tgz -C /opt/
