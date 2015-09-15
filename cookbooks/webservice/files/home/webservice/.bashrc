# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
. ~/.git-completion.bash
. ~/.git-prompt.sh
export LANG=ja_JP.UTF-8

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
