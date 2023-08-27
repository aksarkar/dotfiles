# Check for an interactive session
[ -z "$PS1" ] && return

# Don't echo ^C
stty -ctlecho

alias ls='ls -F --color=always'
alias grep='grep --color=auto'

PS1='\u@\h:\w\$ '

export ALTERNATE_EDITOR=''
export AUR_PAGER='emacsclient'
export BROWSER='qutebrowser'
export EDITOR='emacsclient -c'
export GDK_SCALE=1
export GDK_DPI_SCALE=1
export QT_SCALE_FACTOR=1
export MAILDIR=$HOME/mail
export TERM='xterm-256color'
export PATH=$PATH:$HOME/.local/texlive/2018/bin/x86_64-linux/:$HOME/.local/mambaforge/bin
export VISUAL=$EDITOR
