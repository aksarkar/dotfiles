#!/bin/bash
set -e
mount | grep -q "/mnt/backup" || mount /mnt/backup
mbsync -aq
mu index --quiet --maildir=$HOME/mail
sudo rsnapshot sync
sudo rsnapshot daily
umount /mnt/backup
