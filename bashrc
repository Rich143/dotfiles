# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
if [ -f /usr/local/devtools/bin/bash_completion ]; then
	source /usr/local/devtools/bin/bash_completion
fi
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias ls='ls --color=auto'
    alias ll='ls --color=auto -l'
    alias l='ls --color=auto -al'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    alias ll='ls -l'
    alias l='ls -al'
fi

alias ".."="cd .."
alias "..."="cd ../.."

# Environment variables
export SVN_EDITOR="vim"

export EDITOR=vim
export VISUAL="$EDITOR"

export TERM="screen-256color"
alias tmux="tmux -2"

export PATH=$HOME/bin:$PATH

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\e[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\e[0m'           # end mode
export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\e[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'           # end underline
export LESS_TERMCAP_us=$'\e[04;38;5;146m' # begin underline

export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

export PATH=$PATH:/Applications/MacVim.app/Contents/bin

alias ag='ag --path-to-ignore ~/.ignore'

set -o vi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
