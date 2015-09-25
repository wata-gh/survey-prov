# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
. ~/.git-completion.bash
. ~/.git-prompt.sh
export LANG=ja_JP.UTF-8
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

export PATH=./node_modules/.bin:$PATH

if [ -f ~/.bashrc_local ]; then
	. ~/.bashrc_local
fi
