# Check for an interactive session
[ -z "$PS1" ] && return

# Check for tramp
if [[ "$TERM" == "dumb" && -z "$EDITOR" ]]
then
    export PS1="> "
    return
else
    export TERM='xterm-16color'
fi

# Modules
module load parallel
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

function q {
    squeue -u aksarkar
}

function sa {
    sacct $* -o JobID,JobName,MaxRSS,MaxVMSize,ExitCode,Elapsed
}

alias ls='ls -F --color=always'
alias grep='grep --color=auto'

PS1='\u@\h:\w\$ '

export ALTERNATE_EDITOR=''
export CDPATH=".:/project2/mstephens/aksarkar/projects:/project2/mstephens/aksarkar/.local/src:/project2/mstephens/aksarkar/:$HOME:$SCRATCH:/project2/gilad/singlecell-qtl:/project/compbio"
export EDITOR='emacsclient -c'
export LANG='en_US.UTF-8'
export PAGER=cat
export PATH=/scratch/midway2/aksarkar/miniconda3/bin:/project2/mstephens/aksarkar/.local/bin:$PATH
export VISUAL=$EDITOR
