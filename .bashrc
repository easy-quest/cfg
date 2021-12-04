#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='exa'
alias ll='exa -lh'
alias l='exa -lah'

if [[ ${EUID} == 0 ]] ; then
		PS1='\[\033[01;31m\] \u@\h\[\033[0;33m\] \w\[\033[01;31m\]] \[\033[00m\] \n\$ '
else
		PS1='\[\033[01;32m\] \u@\h\[\033[01;34m\] \w\[\033[01;34m\]] \[\033[00m\] \n\$ '
fi
