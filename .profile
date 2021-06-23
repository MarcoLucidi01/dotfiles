export EDITOR=vim

# if running bash, source .bashrc
if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
fi

# add my bin to PATH
if [ -d "$HOME/bin" ]; then
        PATH="$HOME/bin:$PATH"
fi

# run startx after login in text mode
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
        exec startx
fi
