#!/bin/bash

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    alias ls='ls --color=always -F'
	alias grep='grep --color=auto'
fi

PS1='\[\033[01;32m\]\h'

parse_git_branch() {
  /usr/bin/git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1=$PS1"\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\[\e[0;33;49m\]\$(parse_git_branch)\[\e[0;0m\] \\$ "

# store more history
HISTCONTROL=ignoredups
HISTFILESIZE=409600
HISTSIZE=4096000

EDITOR=$(which nvim)
TERM=xterm-256color
alias vim='nvim'
alias sh='bash'

export EDITOR TERM
