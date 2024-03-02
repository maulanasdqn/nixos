#include <X11/XF86keysym.h>

static const unsigned int borderpx        = 2;
static const unsigned int snap            = 0;
static const int showbar                  = 0;
static const int topbar                   = 0;
static const char *fonts[]                = { 
  "Hack Nerd Font Mono:size=8",
};
static const char dmenufont[]             = "Hack Nerd Font Mono:size=8";   /* set dmenu font */
static const unsigned int systraypinning  = 1;                              /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft   = 1;   	                          /* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing  = 2;                              /* systray spacing */
static const int systraypinningfailfirst  = 1;                              /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray              = 1;                              /* 0 means no systray */
static const int startwithgaps[]          = { 1 };	                        /* 1 means gaps are used by default, this can be customized for each tag */
static const unsigned int gappx[]         = { 6 };                         /* default gap between windows in pixels, this can be customized for each tag */
static const int gapsforone	              = 1;	                            /* 1 enable gaps when only one window is open */
static const char col_gray1[]             = "#191724";
static const char col_gray2[]             = "#31748f";
static const char col_gray3[]             = "#191724";
static const char col_gray4[]             = "#191724";
static const char col_cyan[]              = "#191724";

static const char col_brown_400[]         = "#e0def4";
static const char col_brown_300[]         = "#ebbcba";
static const char col_brown_200[]         = "#ebbcba";
static const char col_brown_100[]         = "#191724";
                                          
static const char *colors[][3]            = {
	[SchemeNorm] = { col_brown_400, col_brown_200, col_brown_100 },
	[SchemeSel]  = { col_brown_400, col_brown_100,  col_brown_200  },
};

static const int lockfullscreen           = 0;                              /* 1 will force focus on the fullscreen window */

static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9"};

static const char *const autostart[] = {
	 "nm-applet", NULL,
  "flameshot", NULL,
  "dwm-status", "default.toml", NULL,
  NULL
};

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "T",      tile },    /* first entry is default */
	{ "N",      NULL },    /* no layout function means floating behavior */
	{ "M",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[]   = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_brown_100, "-nf", col_brown_300, "-sb", col_brown_200, "-sf", col_brown_400, "-b", NULL };
static const char *termcmd[]    = { "st", NULL };
static const char *flamecmd[]   = { "flameshot", "gui", NULL };
static const char *volumedown[] = { "amixer", "-q", "set", "Master", "2%-", "unmute", NULL };
static const char *volumeup[]   = { "amixer", "-q", "set", "Master", "2%+", "unmute", NULL };
static const char *mute[]       = { "amixer", "-q", "set", "Master", "toggle", NULL };
static const char *brightdown[] = { "xbacklight", "-", "10", NULL };
static const char *brightup[]   = { "xbacklight", "+", "10", NULL };
static const char *touchpad[]   = { "touchpad-toggle", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_space,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
 { MODKEY,                       XK_c,      spawn,          {.v = flamecmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
 { MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
 { MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },

 //{ MODKEY|ShiftMask,             XK_i,      setigaps,       {.i = +2 } },
 //{ MODKEY|ControlMask,           XK_i,      setigaps,       {.i = -2 } },
 //{ MODKEY|ShiftMask|ControlMask, XK_i,      setigaps,       {.i = 0  } },
 //{ MODKEY|ShiftMask,             XK_o,      setogaps,       {.i = +2 } },
 //{ MODKEY|ControlMask,           XK_o,      setogaps,       {.i = -2 } },
 //{ MODKEY|ShiftMask|ControlMask, XK_o,      setogaps,       {.i = 0  } },

 { MODKEY,                       XK_minus,  setgaps,        {.i = -5 } },
 { MODKEY,                       XK_equal,  setgaps,        {.i = +5 } },
 { MODKEY|ShiftMask,             XK_minus,  setgaps,        {.i = GAP_RESET } },
 { MODKEY|ShiftMask,             XK_equal,  setgaps,        {.i = GAP_TOGGLE} },
	{ MODKEY,                       XK_p,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_g,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_f,      togglefloating, {0} },
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

	{ MODKEY|ShiftMask,             XK_e,      quit,           {0} },
 { 0,                            XF86XK_AudioLowerVolume,  spawn, { .v = volumedown } },
 { 0,                            XF86XK_AudioRaiseVolume,  spawn, { .v = volumeup } },
 { 0,                            XF86XK_AudioMute,         spawn, { .v = mute } },
 { 0,                            XF86XK_MonBrightnessDown, spawn, { .v = brightdown } },
 { 0,                            XF86XK_MonBrightnessUp,   spawn, { .v = brightup } },
 { 0,                            XF86XK_TouchpadToggle,    spawn, { .v = touchpad } },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

