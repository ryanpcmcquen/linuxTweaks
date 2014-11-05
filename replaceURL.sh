egrep -lRZ 'raw2.github' . | xargs -0 -l sed -i -e 's/raw2.github/raw.githubusercontent/g'
