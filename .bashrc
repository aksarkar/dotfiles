# Check for an interactive session
[ -z "$PS1" ] && return

# Modules
module load Anaconda3
module load cuda
module load plink
module load gcc/4.9

# Don't echo ^C
stty -ctlecho

alias ls='ls -F --color=always'
alias grep='grep --color=auto'

PS1='\u@\h:\w\$ '

export ALTERNATE_EDITOR=''
export EDITOR='emacsclient -c'
export LANG='en_US.UTF-8'
export TERM='xterm-16color'
export VISUAL=$EDITOR
