#!/bin/bash

# aliases
alias python='python3'
alias la='ls -lah $LS_COLOR'
function cl(){ cd "$@" && la; }

# enable colors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# change color of user
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;36m\]\u\[\033[01;30m\]@\[\033[01;33m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$  \D{%F %T}\n\$'


