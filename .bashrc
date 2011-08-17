# Check for an interactive session
[ -z "$PS1" ] && return

# Don't echo ^C
stty -ctlecho

alias ls='ls -F --color=always'
alias la='ls -a'
alias grep='grep --color=auto'

PS1='\u@\h:\w\$ '

export ALTERNATE_EDITOR=''
export BROWSER='conkeror'
export EDITOR='emacsclient -c'
export PATH=$HOME/.local/bin:$PATH
export PYTHONPATH=$HOME/.local/lib/python
export TERM='xterm-256color'
export VISUAL=$EDITOR

use -q GCC-4.4
use -q LSF
use -q Python-3.1
use -q R-2.12
