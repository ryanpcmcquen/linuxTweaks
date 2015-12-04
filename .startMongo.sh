#!/bin/sh
## wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.startMongo.sh -P ~/

DB=${DB:-db}

mkdir -pv ~/mongodb/log
mkdir -pv ~/mongodb/data/${DB}

mongod --directoryperdb --dbpath ~/mongodb/data/${DB} --logpath ~/mongodb/log/mongodb.log --logappend --rest --httpinterface &

