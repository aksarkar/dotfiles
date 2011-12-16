# Check for an interactive session
[ -z "$PS1" ] && return

# Don't echo ^C
stty -ctlecho

alias ls='ls -F --color=always'
alias la='ls -a'
alias grep='grep --color=auto'
alias ml='make -f /usr/local/include/makefiles/Makefile.LATEX '
alias nb='newsbeuter -r '

PS1='\u@\h:\w\$ '

export TERM='xterm-256color'
export ALTERNATE_EDITOR=''
export EDITOR='emacsclient -c'
export VISUAL='emacsclient -c'
