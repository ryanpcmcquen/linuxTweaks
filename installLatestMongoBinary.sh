#!/bin/sh
## curl https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/installLatestMongoBinary.sh | sh
## grabs the latest mongo binary version,
## because compiling mongo takes a lifetime
if [ `getconf LONG_BIT` = "32" ]; then
  MONGOARCH=i686
elif [ `getconf LONG_BIT` = "64" ]; then
  MONGOARCH=x86_64
else
  echo "Your architecture is not supported."
  exit 1
fi

wget -N https://fastdl.mongodb.org/linux/mongodb-linux-${MONGOARCH}-latest.tgz -P /tmp/
sudo tar xvf /tmp/mongodb-linux-${MONGOARCH}-latest.tgz -C /opt/

wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.startMongo.sh -P ~/

echo
echo "MongoDB should be installed, make sure to add it to your path,"
echo "more on that here:"
echo "https://github.com/ryanpcmcquen/linuxTweaks/blob/master/slackware/normal/.bash_profile#L65-L68"
echo
echo "You now have a file named ~/.startMongo.sh that will create the"
echo "necessary directories and start the `mongod` service."
echo
echo "Call it like so:"
echo "  sh ~/.startMongo.sh"
echo
echo "You may also feed it a database name like so (default is 'db'):"
echo "  DB=funky sh ~/.startMongo.sh"
echo
echo "Enjoy!"
echo
