#!/bin/bash
rsync -ru -f '- *.md' -e 'ssh -p2222' ~/misc/ebooks/ root@192.168.1.66:/mnt/onboard/books/
