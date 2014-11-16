wget slackware.com -O slackware-home-page.html
cat slackware-home-page.html | grep "is released!" | head -1 | sed 's/Slackware//g' | sed 's/is released!//g' | sed 's/ //g' > SlackwareStableVersion.txt
rm slackware-home-page.html

SLACKWARESTABLEVER="$( cat SlackwareStableVersion.txt )"

echo $SLACKWARESTABLEVER
