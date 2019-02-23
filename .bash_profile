if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]
then
    eval $(keychain --eval --quiet id_rsa)
    . $HOME/.bashrc
    . startx
    logout
fi
