# Check for an interactive session
[ -z "$PS1" ] && return

# Modules
module load Anaconda3
module load cuda
module load plink
if [[ ! -z $(hostname -s | grep "midway2-login") ]]
then
    partition="broadwl"
    module load emacs
    module load gcc/6.1
elif [[ ! -z $(hostname -s | grep "midway-login") ]]
then
    partition="midway"
    module load gcc/4.9
fi

# Don't echo ^C
stty -ctlecho

function i {
    srun --partition=$partition $* --pty bash
}

function py {
    srun --partition=$partition $* --pty python -i
}

alias ls='ls -F --color=always'
alias grep='grep --color=auto'

PS1='\u@\h:\w\$ '

export ALTERNATE_EDITOR=''
export EDITOR='emacsclient -c'
export LANG='en_US.UTF-8'
export TERM='xterm-16color'
export VISUAL=$EDITOR
