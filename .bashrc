# Check for an interactive session
[ -z "$PS1" ] && return

# Don't echo ^C
stty -ctlecho

alias ls='ls -F --color=always'
alias la='ls -a'
alias ll='ls -l'
alias grep='grep --color=auto'
PS1='\u@\h:\w\$ '

export EDITOR='emacsclient -c --alternate-editor=emacs'
