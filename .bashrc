# Check for an interactive session
[ -z "$PS1" ] && return

# Don't echo ^C
stty -ctlecho

alias ls='ls -F --color=always'
alias grep='grep --color=auto'

PS1='\u@\h:\w\$ '

export ALTERNATE_EDITOR=''
export BROWSER='conkeror'
export EDITOR='emacsclient -c'
export INFOPATH=/usr/local/info:/usr/share/info
export MAILDIR=$HOME/mail
export TERM='xterm-256color'
export VISUAL=$EDITOR
