#!/bin/sh
xs=("http://m.xkcd.com"
    "http://what-if.xkcd.com/"
    "http://thisisindexed.com"
    "http://phdcomics.com"
    "http://survivingtheworld.net"
    "http://satwcomic.com"
    "http://zenpencils.com"
   )
parallel -X conkeror ::: ${xs[*]}
