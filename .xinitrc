xrdb $HOME/.Xresources
xset s off -dpms &              # disable DPMS and prevent screen from blanking
xbindkeys &
unclutter -idle 3 -root -noevents &
battery_monitor &
while [ 1 ]; do dwm_status; sleep 30; done &
redshift -l 41.53:12.28 -t 5300:3300 &> /dev/null &
dropbox start &> /dev/null &
exec dwm
