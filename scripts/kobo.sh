#!/bin/bash
rsync -ru -f '- *.md' ~/misc/ebooks/ kobo:/mnt/onboard/books/
