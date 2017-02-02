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

export PATH=$PATH:/usr/lib/llvm-3.6/bin:$HOME/.local/bin
export PYTHONSTARTUP=$HOME/.pythonstartup
umask 027

if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi
