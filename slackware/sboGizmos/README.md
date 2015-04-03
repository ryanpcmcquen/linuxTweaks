### script to download tarballs from SlackBuild .info files
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/slackware/sboGizmos/sbdl \
      -P /usr/local/bin/
    chmod 755 /usr/local/bin/sbdl

### simpler version of download script, only downloads for your ARCH
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/slackware/sboGizmos/sbdl0 \
      -P /usr/local/bin/
    chmod 755 /usr/local/bin/sbdl0

### update version vars for SBo builds
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/slackware/sboGizmos/sbup \
      -P /usr/local/bin/
    chmod 755 /usr/local/bin/sbup

### put md5sums in info file for easier updates
    wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/slackware/sboGizmos/sbmd \
      -P /usr/local/bin/
    chmod 755 /usr/local/bin/sbmd


These are all installed as part of config-o-matic!
https://github.com/ryanpcmcquen/config-o-matic
