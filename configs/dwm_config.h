/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 0;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=10" };
static const char dmenufont[]       = "monospace:size=10";
static const char base03[]          = "#002b36";
static const char base0[]           = "#839496";
static const char yellow[]          = "#b58900";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { base0,     base03,    base03 },
	[SchemeSel]  = { yellow,    base03,    base03  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class         instance    title       tags mask     isfloating   monitor */
	{ "PlaceHolder", NULL,       NULL,       0,            1,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "[M]",      monocle },
	{ "><>",      NULL },    /* no layout function means floating behavior */
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands */
#define SHCMD(cmd) { "/bin/sh", "-c", cmd, NULL }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[]        = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", base03, "-nf", base0, "-sb", base03, "-sf", yellow, NULL };
static const char *termcmd[]         = { "st", "-e", "tmux", NULL };
static const char *lockscreencmd[]   = { "slock", NULL };
static const char *sleepcmd[]        = { "systemctl", "suspend", NULL };
static const char *volupcmd[]        = SHCMD("amixer -q set Master unmute 10%+ && refreshbar");
static const char *voldowncmd[]      = SHCMD("amixer -q set Master unmute 10%- && refreshbar");
static const char *voltogglecmd[]    = SHCMD("amixer -q set Master toggle && refreshbar");
static const char *mpvplaypausecmd[] = SHCMD("echo cycle pause > $HOME/.config/mpv/control");
static const char *mpvnextcmd[]      = SHCMD("echo playlist-next > $HOME/.config/mpv/control");
static const char *mpvprevcmd[]      = SHCMD("echo playlist-prev > $HOME/.config/mpv/control");
static const char *brightupcmd[]     = { "xbacklight", "-inc", "10", NULL };
static const char *brightdowncmd[]   = { "xbacklight", "-dec", "10", NULL };
static const char *screenshootcmd[]  = SHCMD("scrot $HOME/screenshot_%Y%m%d%H%M%S.png");

#include <X11/XF86keysym.h>

static Key keys[] = {
	/* custom keys */
	{ MODKEY,                       XK_p,                     spawn, {.v = dmenucmd        } },
	{ MODKEY|ShiftMask,             XK_Return,                spawn, {.v = termcmd         } },
	{ ControlMask|ShiftMask,        XK_l,                     spawn, {.v = lockscreencmd   } },
	{ ControlMask|ShiftMask,        XK_s,                     spawn, {.v = sleepcmd        } },
	{ 0,                            XF86XK_Sleep,             spawn, {.v = sleepcmd        } },
	{ ControlMask|ShiftMask,        XK_Up,                    spawn, {.v = volupcmd        } },
	{ 0,                            XF86XK_AudioRaiseVolume,  spawn, {.v = volupcmd        } },
	{ ControlMask|ShiftMask,        XK_Down,                  spawn, {.v = voldowncmd      } },
	{ 0,                            XF86XK_AudioLowerVolume,  spawn, {.v = voldowncmd      } },
	{ ControlMask|ShiftMask,        XK_m,                     spawn, {.v = voltogglecmd    } },
	{ 0,                            XF86XK_AudioMute,         spawn, {.v = voltogglecmd    } },
	{ ControlMask|ShiftMask,        XK_F10,                   spawn, {.v = mpvprevcmd      } },
	{ ControlMask|ShiftMask,        XK_F11,                   spawn, {.v = mpvplaypausecmd } },
	{ 0,                            XF86XK_AudioPlay,         spawn, {.v = mpvplaypausecmd } },
	{ ControlMask|ShiftMask,        XK_F12,                   spawn, {.v = mpvnextcmd      } },
	{ ControlMask|ShiftMask,        XK_Right,                 spawn, {.v = brightupcmd     } },
	{ 0,                            XF86XK_MonBrightnessUp,   spawn, {.v = brightupcmd     } },
	{ ControlMask|ShiftMask,        XK_Left,                  spawn, {.v = brightdowncmd   } },
	{ 0,                            XF86XK_MonBrightnessDown, spawn, {.v = brightdowncmd   } },
	{ 0,                            XK_Print,                 spawn, {.v = screenshootcmd  } },

	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        toggleview,     {0} },
	{ ClkTagBar,            0,              Button3,        view,           {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

