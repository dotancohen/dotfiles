####################################################################
#                                                                  #
# +--------------------------------------------------------------+ #
# |                                                              | #
# |  Sensitive lines at end of file, remove from .bashrc-deploy  | #
# |                                                              | #
# +--------------------------------------------------------------+ #
#                                                                  #
####################################################################

# In git dotfiles!

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi



# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi



# VI keybindings on the CLI
#set -o vi



# Ubuntu's settings above

# Dotan's setting below



PATH=$HOME/.bin:$PATH
export PATH

export LC_ALL=""
export LC_TIME="en_DK.utf8"

export EDITOR=vi

HISTSIZE=10000
HISTFILESIZE=10000
HISTCONTROL=ignoredups

#PS1="✈\h:\W$ "
#PS1="\e[1;32m - \h:\W$\e[m "
#PS1=" - \h:\W$ "
PS1="\e[1;32m - \h:\W$\e[m "



#export BROWSER=/home/dotancohen/.bin/firefox-P-default
export TERM=xterm-256color



alias memgone='ps aux | awk '"'"'$11!~/\[*\]/ {print $6/1024" Mb --> "$11,$12,$13,$14}'"'"' | sort -g | tail'
alias :q!='exit'
alias ff='cd /home/dotancohen/inOut/fromFirefox/'
alias spRunning='ps -A -o pid,cmd | grep PYSPI | grep -v grep'
alias h='vim ~/inOut/tHome/notes.txt'
alias spRunning='ps -A -o pid,cmd | grep PYSPI | grep -v grep'
alias spider-start='nohup python  ~/.bin/PYSPI-0.7-Spider.py > /dev/null 2>&1 &'
alias c='clear;pwd;whoami'
alias o='kde-open'
alias diff='colordiff -U3'



# Version 2013-06-20
function newpass {
	n=0
	if [[ "$1" =~ ^[0-9]+$ ]]; then
		SIZE=$1
	else
		SIZE=16
	fi
	times=10
	shift
	while [[ $n -lt $times ]]; do
		</dev/urandom tr -dc '0-9a-zA-Z@#%^&*()' | head -c$SIZE; echo ""
		$@
		n=$((n+1))
	done
}
# No `!$'"\ because of Bash issues


function say {
	ARGS="$(concatenate_args "$@")"
	mplayer -really-quiet "http://translate.google.com/translate_tts?tl=en&q=$ARGS";
}

function תגיד {
	ARGS="$(concatenate_args "$@")"
	mplayer -really-quiet "http://translate.google.com/translate_tts?tl=iw&q=$ARGS";
}

function concatenate_args
{
	string=""
	for a in "$@" # Loop over arguments
	do
		if [[ "${a:0:1}" != "-" ]] # Ignore flags (first character is -)
		then
			if [[ "$string" != "" ]]
			then
				string+=" " # Delimeter
			fi
			string+="$a"
		fi
	done
	echo "$string"
}


output_selection()
{
    local i=-1;
    local opts=()
    local s=

    while read -r line; do
        opts+=("$line")
        printf "[$((++i))] %s\n" "$line"
    done < <("$@")

    read -p '#?' s

    if [[ $s = *[!0-9]* ]]; then
        printf '%s\n' "'$s' is not numeric." >&2

    elif (( s < 0 )) || (( s >= ${#opts[@]} )); then
        printf '%s\n' "'$s' is out of bounds." >&2

    else
        vim "${opts[$s]}"
    fi
}


# Write out a more usable vim config:
# Add whole ~/.vimrc and ~/.vim/ here
# This will be easy to wget from dotancohen.com and run on any server.
#writevimconfig() {
#    cat <<VIMCONFIG > ~/.vimrc
#" vimrc written from .profile
#
#set number
#syntax on
#set nowrap
#
#VIMCONFIG
#}

# Logins


fortunes
echo "Sourced .bashrc"
