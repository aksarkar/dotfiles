#!/bin/sh
xs=(
    "http://euge.ca"
    "http://m.xkcd.com"
    "http://phdcomics.com"
    "http://satwcomic.com"
    "http://survivingtheworld.net"
    "http://thisisindexed.com"
    "http://what-if.xkcd.com/"
    "http://zenpencils.com"
   )
parallel -j1 -X qutebrowser ::: ${xs[*]}
