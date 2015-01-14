### thanks to robby workman!
http://www.linuxquestions.org/questions/slackware-14/valve-games-dota2-not-working-in-latest-current-4175529131/#post5290040

If someone has some time to play with this stuff and wants to (try to) figure out where it broke:

```
git clone git://anongit.freedesktop.org/git/mesa/drm
git bisect start
git checkout libdrm-2.4.56
git bisect good
git checkout libdrm-2.4.58
git bisect bad
```

At that point, you'll get a different commit to build and test.
What I usually do is something like this:

```
./autogen.sh
./configure (options from build script)
make
make install DESTDIR=/tmp/testing
*open a new root terminal window*
cd /tmp/testing
chown -R root:root .
rm -rf ./usr/man ./usr/doc ./usr/share/doc
makepkg -c n -l y /tmp/libdrm-testing1-$arch-1.tgz
```

Upgrade to that package, test it (no reboot needed - just a kill/restart of X, I would think), and then go back into the libdrm git directory. If all is well with that package, then do this:

```
git bisect good
```
If not, then do this:
```
git bisect bad
```

Either way, you'll get a new revision to test. You'll need to clean out the leftovers from the prior build first though:

```
make clean
git clean
```

Now repeat the build/install process and loop until you find the bad commit.
