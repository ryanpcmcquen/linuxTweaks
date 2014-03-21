#!/bin/sh

sed -i 's/^aaa_elflibs/#aaa_elflibs/g' /etc/slackpkg/blacklist

sed -i 's/^#[0-9]+_SBo/[0-9]+_SBo/g' /etc/slackpkg/blacklist
