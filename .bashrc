# Check for an interactive session
[ -z "$PS1" ] && return

# dotkits
use -q taciturn
use .autoconf-2.69
use .bedtools-2.24.0
use .cmake-3.3.1
use .curl-7.23.0
use .emacs-24.5
use .icc-2015
use .git-2.0.5
use .gtool-0.7.5
use .impute2-2.3.2
use .snptest-2.5.1
use Java-1.7
use Anaconda3
use GCC-4.9
use UGER

# Don't echo ^C
stty -ctlecho

alias ls='ls -F --color=always'
alias grep='grep --color=auto'
alias q='qsub -cwd -V -terse -j y -sync y -S /bin/bash'
alias r='qrsh -q interactive -cwd -V R --vanilla --quiet'
alias m='qmake -cwd -V -now n'
alias i='qrsh -q interactive'

PS1='\u@\h:\w\$ '

export ALTERNATE_EDITOR=''
export CDPATH=.:/broad/compbio/aksarkar/projects/gwas/wtccc1/EC21/results:/broad/compbio/aksarkar/projects:/broad/compbio/aksarkar:/broad/hptmp/aksarkar:$HOME/code
export EDITOR='emacsclient -c'
export LANG='en_US.UTF-8'
export PATH=$PATH:$HOME/.local/bin
export SGE_ARCH=lx-amd64
export TERM='xterm-16color'
export VISUAL=$EDITOR

