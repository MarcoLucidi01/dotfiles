alias sinst="sudo apt-get update && sudo apt-get -s install"
alias inst="sudo apt-get update && sudo apt-get install"
alias srem="sudo apt-get -s purge"
alias rem="sudo apt-get purge"

alias ..="cd .."

alias l="ls --color=auto -F -1 -h"
alias la="l -A"
alias ll="l -l"
alias lal="l -Al"

alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

alias diff="diff --color=auto"

alias mpv="mpv --input-file=$HOME/.config/mpv/control --no-audio-display --fullscreen --sub-auto=fuzzy --sub-codepage=UTF-8-BROKEN"
alias rmpv="mpv --shuffle"

alias g="git"
alias ga="g add"
alias gc="g commit"
alias gd="g diff"
alias gds="gd --staged"
alias gf="g fetch"
alias gl="g log --graph --date='format:%Y-%m-%d %H:%M' --pretty='format:%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s'"
alias gp="g pull"
alias gs="g status"
