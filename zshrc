# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/Applications/ARM/bin:$PATH
#export PATH=~/Tools/gcc-arm-none-eabi-7-2017-q4-major/bin:$PATH
export PATH=$PATH:/Applications/SEGGER/JLink
export PATH=$PATH:~/Apple-Work-Documents/C99/Tools

#HOMEBREW_PATH=/opt/brew
HOMEBREW_PATH=/opt/homebrew

# Make brew bin appear first in path
export PATH=$HOMEBREW_PATH/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/richardmatthews/.oh-my-zsh"

if [[ "$(uname -s)" == "Darwin" ]]; then
    sith() {
        val=$(defaults read -g AppleInterfaceStyle 2>/dev/null)
        if [[ $val == "Dark" ]]; then
            i
        else
            SOLARIZED_THEME="light"
        fi
    }

    i() {
        if [[ $ITERM_PROFILE == "Default" ]]; then
            echo -ne "\033]50;SetProfile=Dark\a"
            export ITERM_PROFILE="Dark"
            SOLARIZED_THEME="dark"
        else
            echo -ne "\033]50;SetProfile=Default\a"
            export ITERM_PROFILE="Default"
            SOLARIZED_THEME="light"
        fi
    }

    sith
else
  SOLARIZED_THEME="light"
fi



# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

ZSH_DISABLE_COMPFIX=true

[[ -d $HOMEBREW_PATH/share/zsh/site-functions/ ]] && fpath+=($HOMEBREW_PATH/share/zsh/site-functions/)

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gits="git status"
alias make="$HOME/bin/make-strip-xcode-warning"

# Hide hostname when not ssh'd
prompt_context() {
  case ${SOLARIZED_THEME:-dark} in
    light) CURRENT_FG='white';;
    *)     CURRENT_FG='black';;
  esac
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment $CURRENT_FG default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk


# vi mode
bindkey -v
zinit light "softmoth/zsh-vim-mode"
MODE_CURSOR_VICMD="green block"
MODE_CURSOR_VIINS="#20d08a blinking bar"
MODE_CURSOR_SEARCH="#ff00ff blinking underline"
MODE_CURSOR_SEARCH="#ff00ff steady underline"
MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady bar"
MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #00ffff"
KEYTIMEOUT=25

zinit light "zsh-users/zsh-autosuggestions"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#2aa198,bg=#002b36,underline"

zinit light "skywind3000/z.lua"

#zinit light zdharma/fast-syntax-highlighting


# FZF
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --path-to-ignore ~/.ag-ignore -g ""'
export FZF_BASE=~/.vim/plugged/fzf/bin
export PATH=$FZF_BASE:$PATH
zinit light 'unixorn/fzf-zsh-plugin'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Apple internal XCLink App
PATH=~/.xclink/bin:$PATH

# Allow using vim to edit current command
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Created by `userpath` on 2020-07-14 15:12:48
export PATH="$PATH:/Users/richardmatthews/.local/bin"

# pipx
autoload -U bashcompinit
bashcompinit
eval "$(register-python-argcomplete pipx)"

#
# Python
#
# https://github.com/pyenv/pyenv-virtualenv
if command -v pyenv 1>/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  #eval "$(pyenv init --path)"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# auto enable python virtual environments
#export WORKON_HOME=$HOME/.virtualenvs
#PYTHON_BIN_DIR=$(python3 -c 'import sysconfig; print(sysconfig.get_paths()["scripts"])')
#source $PYTHON_BIN_DIR/virtualenvwrapper.sh
#function _python-workon-cwd() {
  ## Check if this is a Git repo
  #local GIT_REPO_ROOT=""
  #local GIT_TOPLEVEL="$(git rev-parse --show-toplevel 2> /dev/null)"
  #if [[ $? == 0 ]]; then
    #GIT_REPO_ROOT="$GIT_TOPLEVEL"
  #fi
  ## Get absolute path, resolving symlinks
  #local PROJECT_ROOT="${PWD:A}"
  #while [[ "$PROJECT_ROOT" != "/" && ! -e "$PROJECT_ROOT/.venv" \
            #&& ! -d "$PROJECT_ROOT/.git"  && "$PROJECT_ROOT" != "$GIT_REPO_ROOT" ]]; do
    #PROJECT_ROOT="${PROJECT_ROOT:h}"
  #done
  #if [[ "$PROJECT_ROOT" == "/" ]]; then
    #PROJECT_ROOT="."
  #fi
  ## Check for virtualenv name override
  #local ENV_NAME=""
  #if [[ -f "$PROJECT_ROOT/.venv" ]]; then
    #ENV_NAME="$(cat "$PROJECT_ROOT/.venv")"
  #elif [[ -f "$PROJECT_ROOT/.venv/bin/activate" ]];then
    #ENV_NAME="$PROJECT_ROOT/.venv"
  #elif [[ "$PROJECT_ROOT" != "." ]]; then
    #ENV_NAME="${PROJECT_ROOT:t}"
  #fi
  #if [[ -n $CD_VIRTUAL_ENV && "$ENV_NAME" != "$CD_VIRTUAL_ENV" ]]; then
    ## We've just left the repo, deactivate the environment
    ## Note: this only happens if the virtualenv was activated automatically
    #deactivate && unset CD_VIRTUAL_ENV
  #fi
  #if [[ "$ENV_NAME" != "" ]]; then
    ## Activate the environment only if it is not already active
    #if [[ "$VIRTUAL_ENV" != "$ENV_NAME" ]]; then
      ##echo "Activating virtual env"
      #if [[ -e "$ENV_NAME/bin/activate" ]]; then
        #source $ENV_NAME/bin/activate && export CD_VIRTUAL_ENV="$ENV_NAME"
      #elif [[ -e "$WORKON_HOME/$ENV_NAME/bin/activate" ]]; then
        #workon "$ENV_NAME" && export CD_VIRTUAL_ENV="$ENV_NAME"
      #fi
    #fi
  #fi
#}
#add-zsh-hook chpwd _python-workon-cwd
source ~/dotfiles/zsh/virtualenv-auto-activate.sh

#homebrew
export PATH="$HOMEBREW_PATH/sbin:$PATH"
[[ :$PATH: == *:$HOME/bin:* ]] || PATH=$HOME/bin:$PATH

# Don't share history between shells
unsetopt share_history


# fzf git checkout
[ -f ~/dotfiles/zsh/fzf-git-checkout.sh ] && source ~/dotfiles/zsh/fzf-git-checkout.sh

# Renode
alias renode='mono /Applications/Renode.app/Contents/MacOS/bin/Renode.exe'
alias renode-test='/Applications/Renode.app/Contents/MacOS/tests/renode-test'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

