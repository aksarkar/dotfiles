[[ -z $(pgrep -u aksarkar emacs) ]] && emacs --daemon -l $HOME/.emacs.d/init.el
emacsclient -t
