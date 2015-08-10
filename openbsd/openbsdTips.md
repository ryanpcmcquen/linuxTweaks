upgrade:

    pkg_add -uv


pkg_add -Uuv seems to be pretty similar, allegedly U means to update
deps before the install of a package, so it is probably useless

you have to have a PKG_PATH set in .profile to install stuff,
for example:

    PKG_PATH=http://ftp3.usa.openbsd.org/pub/OpenBSD/$(uname -r)/packages/$(arch -s)
    PKG_PATH=https://stable.mtier.org/updates/$(uname -r)/$(arch -s):${PKG_PATH}
    export PKG_PATH

to run openbsd current, you would just use one mirror like so:

    PKG_PATH=http://ftp3.usa.openbsd.org/pub/OpenBSD/snapshots/packages/$(arch -s)
    export PKG_PATH

