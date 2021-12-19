# prevent screen from blanking, disable dpms and increase keyboard speed
xset s off -dpms r rate 300 50 &

# turn on second monitor if connected (without & to avoid race conditions)
2monitor on

# adjust color temperature of display according to time of day (position of sun)
redshift -l 41.53:12.28 -t 5000:3000 &

# remove idle cursor image
unclutter -idle 3 -root -noevents &

# map CapsLock to both Ctrl and Escape (acts as Ctrl when is pressed along with
# other keys, acts as Escape when is pressed and released on its own)
setxkbmap -option 'caps:ctrl_modifier' &
xcape -e 'Caps_Lock=Escape' &

# status bar daemon
sbard &

# compositor to fix screen tearing while using modesetting video driver
picom --daemon &

# set background to black (xsetroot doesn't work with picom)
hsetroot -solid '#000000' &

# fix misbehaving java apps
export _JAVA_AWT_WM_NONREPARENTING=1

exec dwm
