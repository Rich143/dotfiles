# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH
export MANPATH=$MANPATH:$HOME/share/man
export GREP_OPTIONS='--color=auto'

eval `dircolors ~/.dircolors.dark`

# Reset
Color_Off='\[\e[0m\]'       # Text Reset

# Colors will work nice when used with "Solarized" palette.
# Nothing new here
White='\[\e[0;37m\]'        # White
BPurple='\[\e[1;35m\]'      # Purple
Green='\[\e[0;32m\]'        # Green
Blue='\[\e[0;34m\]'         # Blue
Yellow='\[\e[0;33m\]'       # Yellow
Purple='\[\e[0;35m\]'       # Purple
BWhite='\[\e[1;37m\]'       # White

# custom prompt.
# User input is colored in white
# the trap will reset the colors before execution of commands
PS1="${Green}\u${Color_Off}@${Blue}\h${Color_Off}:[${Yellow}\w${Color_Off}]${Purple}$ ${BWhite}"
#PS1="${BPurple}\A ${Green}\u${Color_Off}@${Blue}\h${Color_Off}:[${Yellow}\w${Color_Off}]${Purple}$ ${BWhite}"

# reset color after prompt
trap "echo -ne '\e[0m'" DEBUG

#export PATH=$HOME/local/bin:$HOME/vim74/bin:$PATH

alias svnc="svn status"
alias code="cd /opt/cvsdirs/rmatthews/"

source ~/bin/svn.bash

alias solsend="/home/rmatthews/semp/solsend"
