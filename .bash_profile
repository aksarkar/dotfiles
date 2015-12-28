. ~/.bashrc
[[ -z "$PS1" ]] && return
[[ -z $(echo "gold platinum silver" | grep $(hostname -s)) ]] && return
eval `$HOME/.local/bin/keychain -q --nocolor --eval $HOME/.ssh/id_rsa`
[[ -z $(pgrep -u aksarkar emacs) ]] && emacs --daemon -l $HOME/.emacs.d/init.el
emacsclient -t
