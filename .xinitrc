# disable dpms and prevent screen from blanking
xset s off -dpms &

# turn on second monitor if connected
2monitor on &

# adjust color temperature of display according to time of day (position of sun)
redshift -l 41.53:12.28 -t 5000:3000 &

# remove idle cursor image
unclutter -idle 3 -root -noevents &

# status bar daemon
sbard &

exec dwm
