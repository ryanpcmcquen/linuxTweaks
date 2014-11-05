#!/bin/sh

egrep -lRZ 'raw2.github' . | xargs -0 -l sed -i -e 's/raw2.github/raw.githubusercontent/g'




egrep -lRZ 'foo' . | xargs -0 -l sed -i -e 's/foo/bar/g'

find . -exec sed -i -e 's/foo/bar/g' {} \;
