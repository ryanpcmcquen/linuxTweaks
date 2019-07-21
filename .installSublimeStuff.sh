#!/bin/sh

if [ -z "$(which subl)" ]; then
    if [ "$(which apt)" ]; then
        echo
        echo "Package manager detected: apt"
        echo
        wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
        echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
        sudo apt-get install -y apt-transport-https
        sudo apt-get update
        sudo apt-get install -y sublime-text sublime-merge
    elif [ "$(which pacman)" ]; then
        echo
        echo "Package manager detected: pacman"
        echo
        curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
        echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
        sudo pacman -Syu sublime-text sublime-merge
    elif [ "$(which dnf)" ]; then
        echo
        echo "Package manager detected: dnf"
        echo
        sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
        sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
        sudo dnf install sublime-text sublime-merge
    elif [ "$(which yum)" ]; then
        echo
        echo "Package manager detected: yum"
        echo
        sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
        sudo yum-config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
        sudo yum install sublime-text sublime-merge
    elif [ "$(which zypper)" ]; then
        echo
        echo "Package manager detected: zypper"
        echo
        sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
        sudo zypper addrepo -g -f https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
        sudo zypper install sublime-text sublime-merge
    else
        echo
        echo "No compatible package manager found. Please download the tarball here:"
        echo "https://www.sublimetext.com/3"
        echo
    fi
else
    echo
    echo "Sublime stuff is already installed."
    echo
fi
