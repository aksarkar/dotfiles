#!/bin/bash
set -e
mount | grep -q "/mnt/backup" || mount /mnt/backup
mbsync -aq
mu index -q
sudo rsnapshot sync
sudo rsnapshot daily
umount /mnt/backup
