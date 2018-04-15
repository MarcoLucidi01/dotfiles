xrdb $HOME/.Xresources
xset s off -dpms &              # disable DPMS and prevent screen from blanking
xbindkeys &
unclutter -idle 3 -root -noevents &
$HOME/utils/battery_monitor.sh &
while [ 1 ]; do $HOME/utils/dwm_status.sh; sleep 30; done &
redshift -l 41.53:12.28 -t 5300:3300 &> /dev/null &
dropbox start &> /dev/null &
xterm &> /dev/null &
exec dwm
