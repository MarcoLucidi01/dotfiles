# one character
alias d="pwd"
alias g="git"
alias l="ls -1"
alias n="vim $HOME/docs/notes"
alias t="todo"
alias v="vim"
alias w="web"

# ls
alias la="ls -A1"
alias lal="ls -Al"
alias lc="ls"
alias lca="ls -A"
alias ll="ls -l"
alias ls="ls -Fh --literal --color=auto"

# git
alias ga="git add"
alias gap="git add --patch"
alias gb="git branch"
alias gc="git commit"
alias gca="git commit --amend"
alias gd="git diff"
alias gds="git diff --staged"
alias gf="git fetch"
alias gl="git log --graph --date='format:%Y-%m-%d %H:%M' --pretty='format:%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s'"
alias gp="git pull"
alias gs="git status"
alias gss="git status --short"
alias gw="git show"

# apt-get
alias purge="sudo apt-get purge"
alias spurge="sudo apt-get -s purge"
alias supinstall="sudo apt-get update && sudo apt-get -s install"
alias upinstall="sudo apt-get update && sudo apt-get install"

# translate
alias tre="translate en:it"
alias tri="translate it:en"

# headphones
alias ep="headphones A8:4D:4A:08:98:AE"
alias hp="headphones 78:2B:64:13:E0:C4"

# youtube-dl
alias ytdl="youtube-dl"
alias ytjson="youtube-dl --dump-json --flat-playlist"

# misc
alias ..="cd .."
alias cal="ncal -M -b"
alias diff="diff --color=auto"
alias feh="feh --theme options"
alias grep="grep --color=auto"
alias music="mpv --shuffle $HOME/music"
alias news="newsboat"
alias xargs="xargs " # use xargs with aliases https://unix.stackexchange.com/a/244516/183407
