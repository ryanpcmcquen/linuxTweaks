#!/bin/bash

slackpkg install google-chrome

mkdir ~/builds
mkdir ~/builds/google-chrome

wget http://mirrors.slackware.com/slackware/slackware-14.0/extra/google-chrome/google-chrome.SlackBuild -P ~/builds/google-chrome/

wget http://mirrors.slackware.com/slackware/slackware-14.0/extra/google-chrome/slack-desc -P ~/builds/google-chrome/

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P ~/builds/google-chrome/

chmod +x ~/builds/google-chrome/google-chrome.SlackBuild

sh ~/builds/google-chrome/google-chrome.SlackBuild

slackpkg blacklist google