# if not running interactively, don't do anything
case $- in
*i*)
        ;;
*)
        return ;;
esac

# prompt
PS1='\$ '

# don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# append to the history file, don't overwrite it
shopt -s histappend

# check window size after each command and update LINES and COLUMNS if necessary
shopt -s checkwinsize

# enable color support of ls
if [ -x /usr/bin/dircolors ]; then
        eval "$(dircolors -b)"
fi

# source aliases
if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
fi

# enable programmable completion features
if ! shopt -oq posix; then
        if [ -f /usr/share/bash-completion/bash_completion ]; then
                . /usr/share/bash-completion/bash_completion
        elif [ -f /etc/bash_completion ]; then
                . /etc/bash_completion
        fi
fi

# enable z (https://github.com/rupa/z). print working directory after jump
. "$HOME/bin/z.sh"
function zpwd() {
        local old="$PWD"
        z "$@"
        if [ "$old" != "$PWD" ]; then
                echo "$PWD"
        fi
}
alias z="zpwd"

# pass options to claws-mail if already running (e.g. --status, --compose),
# otherwise run it in the background
function claws() {
        if [ "$#" -gt 0 ] && pgrep claws-mail > /dev/null; then
                claws-mail "$@"
        else
                (cd "$HOME" && claws-mail "$@" > /dev/null 2>&1 &)
        fi
}
alias m="claws"

# go workspace path
export GOPATH="$HOME/.go"

# fzf setup and bash-bindings
export FZF_DEFAULT_COMMAND="find ."
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND -type d"
export FZF_DEFAULT_OPTS="--multi --reverse --height=50% --bind=esc:cancel --color=fg+:136,hl:37,hl+:37"
source /usr/share/doc/fzf/examples/key-bindings.bash
