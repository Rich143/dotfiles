# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
if [ -f /usr/local/devtools/bin/bash_completion ]; then
	source /usr/local/devtools/bin/bash_completion
fi

if [ -r /opt/soldev/devtools/bin/soldv_env.sh ]; then
	/opt/soldev/devtools/bin/soldv_env.sh
fi

alias ls='ls --color=auto'
alias ll='ls --color=auto -l'
alias l='ls --color=auto -al'
alias ".."="cd .."
alias "..."="cd ../.."

# Environment variables
export SVN_EDITOR="vim"
export EMAIL=richard.matthews@solacesystems.com

export EDITOR=vim
export VISUAL="$EDITOR"

export TERM="screen-256color"
alias tmux="tmux -2"

export PATH=$HOME/bin:$PATH

export PATH=$HOME/local/bin:$HOME/vim74/bin:$PATH

# Router shell access function
rsh() { startTime=$(date +%s); TERM=xterm ssh -o NumberOfPasswordPrompts=0 root@$*; endTime=$(date +%s); if [ $(( $endTime - $startTime )) -le 5 ]; then addkeyto $1; TERM=xterm ssh -o NumberOfPasswordPrompts=0 root@$*; else echo "$rc"; fi; }

# Router load/solbase copy functions
copyload() {
    HOST=$1
    LOAD=$(echo $2 | sed s/^D/current_D/)
    if [ $(readlink /home/public/RND/loads/solcbr/$LOAD) ]; then
        LOAD=$(readlink /home/public/RND/loads/solcbr/$LOAD)
    fi
    if [ -r /home/public/RND/loads/solcbr/$LOAD.tar.gz ]; then
        true
    elif [ -r /home/public/RND/loads/solcbr/$LOAD/production/soltr_*.tar.gz ]; then
        true
    else
        LOAD=$(cd /home/public/RND/loads/solcbr; /bin/ls -d1 $LOAD* | python -c 'import sys; a = sys.stdin.readlines(); b = [map(int, z.strip().split(".")[:4]) for z in a]; print ".".join(map(str, sorted(b)[-1]))')
    fi
    echo -n Using load $LOAD. Testing connectivity...
    rsh $1 "echo"
    echo OK
    if [ -r /home/public/RND/loads/solcbr/$LOAD.tar.gz ]; then
        echo -n Extracting load from tarball...
        tar -xOf /home/public/RND/loads/solcbr/$LOAD.tar.gz home/public/RND/loads/solcbr/$LOAD/production/soltr_$LOAD.tar.gz | ssh root@$HOST "cat > /usr/sw/jail/loads/soltr_$LOAD.tar.gz"
        echo OK
    else
        echo Using scp
        scp /home/public/RND/loads/solcbr/$LOAD/production/soltr_*.tar.gz root@$HOST:/usr/sw/jail/loads/
    fi
}
copysolbase() {
    HOST=$1
    VER=$2
    echo -n Using SolBase $VER. Testing connectivity...
    rsh $1 "echo"
    echo OK
    echo Using scp
    scp /home/public/RND/loads/sting/base/SolBase-$VER.tgz root@$HOST:/usr/sw/jail/loads/
}


# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\e[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\e[0m'           # end mode
export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\e[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'           # end underline
export LESS_TERMCAP_us=$'\e[04;38;5;146m' # begin underline

diffGenerated() {
    i=solcbr/obj_Linux-x86_64-centos7_lm_debug/common/commands; diff -I ' *//.*' -ux '*.d' -x '*.o' -r $i ../$1/$i;
}

