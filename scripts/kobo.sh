#!/bin/bash
rsync -au -f '- *.md' -e 'ssh -p2222' ~/misc/ebooks/ kobo:/mnt/onboard/books/
