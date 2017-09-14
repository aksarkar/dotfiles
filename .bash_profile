. ~/.bashrc
[[ -z "$PS1" ]] && return
[[ -z $(echo "midway-login1 midway-login2 midway2-login1 midway2-login2" | grep $(hostname -s)) ]] && return
eval `/broad/compbio/aksarkar/.local/bin/keychain -q --nocolor --eval $HOME/.ssh/id_rsa`
[[ -z $(pgrep -u aksarkar emacs) ]] && emacs --daemon -l $HOME/.emacs.d/init.el
emacsclient -t
