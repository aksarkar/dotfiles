# Check for an interactive session
[ -z "$PS1" ] && return

# dotkits
use -q taciturn
use .git-2.16.1
use .emacs-26.2
use Anaconda3
use GCC-5.2
use Matlab
use UGER

# Don't echo ^C
stty -ctlecho

function r() {
    qrsh -q interactive -cwd -V -pty y $* R --no-save --no-restore --quiet --interactive;
}

alias ls='ls -F --color=always'
alias grep='grep --color=auto'
alias q='qsub -cwd -V -terse -j y -sync y -S /bin/bash'
alias m='qmake -V -now n'
alias i='qrsh -q interactive -cwd -V -pty y'

PS1='\u@\h:\w\$ '

export ALTERNATE_EDITOR=''
export CDPATH=.:/broad/compbio/aksarkar/projects/roadmap:/broad/compbio/aksarkar/projects:/broad/compbio/aksarkar:/broad/compbio/aksarkar/.local/src:/broad/hptmp/aksarkar:$HOME/code
export EDITOR='emacsclient -c'
export LANG='en_US.UTF-8'
export MCRROOT=$(readlink -f $(dirname $(which matlab))/..)
export PATH=/broad/compbio/aksarkar/.local/bin:$PATH
export R_LIBS_USER=$HOME/R/x86_64-unknown-linux-gnu-library
export SGE_ARCH=lx-amd64
export TERM='xterm-16color'
export VISUAL=$EDITOR
if [[ -z "$LD_LIBRARY_PATH" ]]
then
    export LD_LIBRARY_PATH=$LIBRARY_PATH
fi
