#!/bin/bash
set -e
mount | grep -q "/media/backup" || mount /media/backup
mbsync -aq
mu index --quiet --maildir=$HOME/mail
rdiff-backup --exclude '**[cC]ache' --exclude "**downloads" /home/asarkar /media/backup/asarkar
umount /media/backup
