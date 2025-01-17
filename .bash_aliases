# one character
alias d="pwd"
alias g="git"
alias l="ls -1"
alias t="todo"
alias v="vim"
alias w="web"
alias x="xargs " # use xargs with aliases https://unix.stackexchange.com/a/244516/183407

# ls
alias la="ls -A1"
alias lal="ls -Al"
alias lalt="ls -Alt | head"
alias lat="ls -At1 | head"
alias lc="ls"
alias lca="ls -A"
alias ll="ls -l"
alias llt="ls -lt | head"
alias ls="ls -Fh --literal --color=auto"
alias lt="ls -t1 | head"

# git
alias ga="git add"
alias gap="git add --patch"
alias gau="git add --update"
alias gb="git branch"
alias gc="git commit"
alias gca="git commit --amend"
alias gcf="git commit --fixup"
alias gd="git diff"
alias gds="git diff --staged"
alias gf="git fetch"
alias gl="git log --graph --date='format:%Y-%m-%d %H:%M' --pretty='format:%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s'"
alias gp="git pull"
alias gs="git status"
alias gss="git status --short"
alias gw="git show"
alias gws="git show --stat"

# apt-get
alias purge="sudo apt-get purge"
alias spurge="sudo apt-get -s purge"
alias supinstall="sudo apt-get update && sudo apt-get -s install"
alias upinstall="sudo apt-get update && sudo apt-get install"

# translate
alias tre="translate en:it"
alias tri="translate it:en"

# headphones
alias ep="headphones 41:42:95:9E:4F:26"
alias hp="headphones 78:2B:64:13:E0:C4"

# yt-dlp
alias ytdl="yt-dlp"
alias ytjson="yt-dlp --dump-json --flat-playlist"

# interactive
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# misc
alias ..="cd .."
alias cal="ncal -M -b"
alias diff="diff --color=auto"
alias feh="feh --theme options"
alias grep="grep --color=auto"
alias more="more --exit-on-eof"
alias news="sfeedwrapper"
alias xc="xclip -rmlastnl -selection clipboard"
