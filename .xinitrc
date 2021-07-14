# disable dpms and prevent screen from blanking
xset s off -dpms &

# turn on second monitor if connected
2monitor on &

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

exec dwm
