#!/bin/bash
qemu-system-x86_64 -enable-kvm -boot d $HOME/.vm/win7.vm -m 4096 -vga std $*
