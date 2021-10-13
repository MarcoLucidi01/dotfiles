/* see LICENSE file for copyright and license details */

#define NOTAVAILABLE    "N/A"   /* placeholder */

enum {
        MAXBARLEN       = 1024,
        REFRESHINTERVAL = 60,   /* in seconds */
};

/*
 * Configuration for the battery function.
 *
 * Look at /sys/class/power_supply for battery and AC names.
 * TODO battery and AC names could be easily detected at runtime.
 *
 * The function returns average capacity percentage.
 *
 *   names        NULL terminated array of battery names
 *   acname       usually AC
 *   low          low capacity level
 *   critical     critical capacity level
 *   criticalcmd  command executed when critical level is reached (or NULL for no command)
 */
BatConfig batconfig = {
        .names       = (const char *[]){ "BAT0", "BAT1", NULL },
        .acname      = "AC",
        .low         = 20,
        .critical    = 10,
        .criticalcmd = "gxmessage -bg red -fg white -center -font 'monospace 50' -default cancel "
                       "-title 'battery level critical' -buttons 'systemctl poweroff:0,cancel:1' "
                       "'battery reached\ncritical level!' && systemctl poweroff",
};

/*
 * Bar configuration. All functions take one argument and return a string
 * containing the information to display in the bar.
 *
 *   function    return                                                 argument
 *
 *   battery     average capacity percentage of batteries and ac status BatConfig
 *   datetime    formatted date and/or time                             format string for strftime()
 *   memory      amount of memory used in MB or GB                      NULL
 *   sh          first line of output of shell command                  shell command to run
 *   temperature temperature in celsius of thermal zone                 thermal zone name
 *   volume      percentage of playback volume fetched using alsa       NULL
 *   wireless    percentage of wireless link quality if connected       interface name
 */
Config config[] = {
        { .fmt = "v:%s ",       .func = volume,         .arg = NULL },
        { .fmt = "b:%s ",       .func = battery,        .arg = &batconfig },
        { .fmt = "%s",          .func = datetime,       .arg = "%H:%M" },
};
