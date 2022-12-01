# Check for an interactive session
[ -z "$PS1" ] && return

# Don't echo ^C
stty -ctlecho

alias ls='ls -F --color=always'
alias grep='grep --color=auto'

PS1='\u@\h:\w\$ '

export ALTERNATE_EDITOR=''
export AUR_PAGER='emacsclient'
export BROWSER='conkeror'
export EDITOR='emacsclient -c'
export GDK_SCALE=1
export GDK_DPI_SCALE=.5
export MAILDIR=$HOME/mail
export TERM='xterm-256color'
export PATH=$PATH:$HOME/.local/texlive/2018/bin/x86_64-linux/:$HOME/.local/mambaforge/bin
export VISUAL=$EDITOR

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/aksarkar/.local/mambaforge/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/aksarkar/.local/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/home/aksarkar/.local/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/home/aksarkar/.local/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/aksarkar/.local/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/home/aksarkar/.local/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

