#!/bin/sh
xs=("http://m.xkcd.com"
    "http://what-if.xkcd.com/"
    "http://thisisindexed.com"
    "http://phdcomics.com"
    "http://survivingtheworld.net"
    "http://euge.ca"
    "http://satwcomic.com"
   )

for x in ${xs[@]}
do
    conkeror $x
done
