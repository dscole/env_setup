# ~/.bashrc: executed by bash(1) for non-login shells.
#            login shell - when you log into the machine, either locally (when choosing gnome) or
#            remotely using ssh.
#            This means every new shell (running > bash) sources this file
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

export RED="\[\033[0;31m\]"
export GREEN="\[\033[0;32m\]"
export YELLOW="\[\033[0;33m\]"
export BLUE="\[\033[0;34m\]"
export MAGENTA="\[\033[0;35m\]"
export CYAN="\[\033[0;36m\]"
export WHITE="\[\033[0;37m\]"

export BOLD_RED="\[\033[1;31m\]"
export BOLD_GREEN="\[\033[1;32m\]"
export BOLD_YELLOW="\[\033[1;33m\]"
export BOLD_BLUE="\[\033[1;34m\]"
export BOLD_MAGENTA="\[\033[1;35m\]"
export BOLD_CYAN="\[\033[1;36m\]"
export BOLD_WHITE="\[\033[1;37m\]"

export RESET="\[\033[0m\]"
export BOLD="\[\033[1m\]"
export FancyX='\342\234\227'
export Checkmark='\342\234\223'

function timer_now {
    date +%s%N
}

function timer_start {
    start=${start:-$(timer_now)}
}

function timer_stop {
    local delta_us=$((($(timer_now) - $start) / 1000))
    local us=$((delta_us % 1000))
    local ms=$(((delta_us / 1000) % 1000))
    local s=$(((delta_us / 1000000) % 60))
    local m=$(((delta_us / 60000000) % 60))
    local h=$((delta_us / 3600000000))
    # Goal: always show around 3 digits of accuracy
    if ((h > 0)); then timer_show=${h}h${m}m
    elif ((m > 0)); then timer_show=${m}m${s}s
    elif ((s >= 10)); then timer_show=${s}.$((ms / 100))s
    elif ((s > 0)); then timer_show=${s}.$(printf %03d $ms)s
    elif ((ms >= 100)); then timer_show=${ms}ms
    elif ((ms > 0)); then timer_show=${ms}.$((us / 100))ms
    else timer_show=${us}us
    fi
    timer_show=$(printf %06s $timer_show)
    unset start
}

set_prompt () {
    local exit_code=$? # Must come first!
    load=$(uptime | sed 's/,//g' | awk '{print $(NF-2)}')
    timer_stop
    PS1=""
    PS1+="$WHITE[$GREEN$timer_show $CYAN$load$WHITE] "
    PS1+="$YELLOW\D{%m/%d %T} $CYAN\w ";
    if [ $exit_code != 0 ]; then
        PS1+="$BOLD_RED$FancyX$RESET "
    else
        PS1+="$BOLD_GREEN$Checkmark$RESET "
    fi
    # Save and reload the history after each command finishes
    history -a; history -c; history -r;
}

trap 'timer_start' DEBUG
export PROMPT_COMMAND='set_prompt'

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
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

    # fix OTHER WRITABLE color to something sane (green on red, instead of green on blue)
    # source: http://www.bigsoft.co.uk/blog/index.php/2008/04/11/configuring-ls_colors
    export LS_COLORS=$LS_COLORS:'ow=32;41'

    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

umask 027
