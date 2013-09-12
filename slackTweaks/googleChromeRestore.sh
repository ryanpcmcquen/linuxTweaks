#!/bin/bash

slackpkg install google-chrome

mkdir ~/builds
mkdir ~/builds/google-chrome

wget http://mirrors.slackware.com/slackware/slackware-14.0/extra/google-chrome/google-chrome.SlackBuild ~/builds/google-chrome/google-chrome.SlackBuild

wget http://mirrors.slackware.com/slackware/slackware-14.0/extra/google-chrome/slack-desc ~/builds/google-chrome/slack-desc

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb ~/builds/google-chrome/google-chrome-stable_current_amd64.deb

slackpkg blacklist google