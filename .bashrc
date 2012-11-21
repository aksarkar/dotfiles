# Check for an interactive session
[ -z "$PS1" ] && return

# Don't echo ^C
stty -ctlecho

# git completion
. $HOME/.local/src/git/contrib/completion/git-completion.bash

alias ish='bsub -q interactive -Is bash'
alias ls='ls -F --color=always'
alias la='ls -a'
alias grep='grep --color=auto'

PS1='\u@\h:\w\$ '

export ALTERNATE_EDITOR=''
export BROWSER='conkeror'
export EDITOR='emacsclient -c'
export LANG='en_US.utf8'
export LSB_DEFAULTPROJECT='compbiofolk'
export MANPATH=$MANPATH:$HOME/.local/share/man
export PATH=$HOME/.local/bin:$PATH
export PYTHONPATH=$HOME/.local/lib/python
export TERM='xterm-256color'
export VISUAL=$EDITOR

reuse -q GCC-4.4  # need to reset LD_LIBRARY_PATH
use -q LSF
use -q R-2.12
