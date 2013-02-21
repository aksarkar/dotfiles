eval `$HOME/.local/bin/keychain -q --nocolor --eval $HOME/.ssh/id_rsa`
[[ $(hostname) = "nickel.broadinstitute.org" ]] && screen -D -RR
