xset s off -dpms &
monsetup &
unclutter -idle 3 -root -noevents &
battery_monitor &
sbard &
redshift -l 41.53:12.28 -t 5300:3300 &> /dev/null &
dropbox start &> /dev/null &
exec dwm
