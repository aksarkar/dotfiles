# Check for an interactive session
[ -z "$PS1" ] && return

# Don't echo ^C
stty -ctlecho

alias ls='ls -F --color=always'
alias grep='grep --color=auto'

PS1='\u@\h:\w\$ '

export ALTERNATE_EDITOR=''
export AUR_PAGER='emacsclient'
export EDITOR='emacsclient -c'
export INFOPATH=/usr/local/info:/usr/share/info
export TERM='xterm-256color'
export VISUAL=$EDITOR

eval $(keychain --eval --quiet id_rsa)

if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
    exec sway
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/aksarkar/.local/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/aksarkar/.local/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/aksarkar/.local/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/aksarkar/.local/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
export MAMBA_EXE='/home/aksarkar/.local/miniforge3/bin/mamba';
export MAMBA_ROOT_PREFIX='/home/aksarkar/.local/miniforge3';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
