sudo apt-get update && sudo apt-get dist-upgrade -y

sudo apt-get install build-essential linux-generic git git-core curl htop vim ruby ruby-dev rubygems python-dev python-setuptools python-pip dkms virtualbox mc

sudo add-apt-repository -y ppa:libreoffice/ppa
sudo add-apt-repository -y ppa:shutter/ppa
sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp
sudo add-apt-repository -y "deb http://repository.spotify.com stable non-free"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59

sudo apt-get update && sudo apt-get install libreoffice shutter gimp spotify-client

sudo apt-get autoclean && sudo apt-get clean && sudo apt-get autoremove -y
