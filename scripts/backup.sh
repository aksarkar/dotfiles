#!/bin/bash
set -e
mount | grep -q "/media/backup" || mount /media/backup
mbsync -aq
mu index --quiet --maildir=$HOME/mail
sudo rsnapshot sync
sudo rsnapshot daily
umount /media/backup
