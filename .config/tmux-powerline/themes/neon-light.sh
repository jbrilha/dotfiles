# shellcheck shell=bash disable=SC2034
####################################################################################################
# Light counterpart to neon.sh, picked automatically when the OS is in light mode.
# colors are inspired by catppuccin palettes (https://github.com/catppuccin/catppuccin)
####################################################################################################

# COLORS

# background for latte catppuccin terminal theme
thm_bg="#EFF1F5"

thm_fg="#4c4f69"
thm_cyan="#04a5e5"
thm_black="#e6e9ef"
thm_gray="#ccd0da"
thm_magenta="#8839ef"
thm_pink="#ea76cb"
thm_blue="#1e66f5"
thm_black4="#acb0be"
rosewater="#dc8a78"
flamingo="#dd7878"
pink="#ea76cb"
mauve="#8839ef"
red="#d20f39"
maroon="#e64553"
peach="#fe640b"
yellow="#df8e1d"
avocado_green="#40a02b"
green="#40a02b"
teal="#179299"
sky="#04a5e5"
sapphire="#209fb5"
blue="#1e66f5"
lavender="#7287fd"
text="#4c4f69"
subtext1="#5c5f77"
subtext0="#6c6f85"
overlay2="#7c7f93"
overlay1="#8c8fa1"
overlay0="#9ca0b0"
surface2="#acb0be"
surface1="#bcc0cc"
surface0="#ccd0da"
base="#eff1f5"
mantle="#e6e9ef"
crust="#dce0e8"
eggplant="#ea76cb"
sky_blue="#04a5e5"
spotify_green="#1db954"
spotify_black="#191414"
aubergine="#d20f39"
cyan="#04a5e5"
white="#FFFFFF"
black="#000000"

TMUX_POWERLINE_SEPARATOR_LEFT_BOLD=""
TMUX_POWERLINE_SEPARATOR_LEFT_THIN="|"
TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD=""
TMUX_POWERLINE_SEPARATOR_RIGHT_THIN="|"
TMUX_POWERLINE_SEPARATOR_THIN="|"

# See Color formatting section below for details on what colors can be used here.
TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR:-terminal}
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR:-$green}
TMUX_POWERLINE_SEG_AIR_COLOR="#8839ef"

TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}
TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}

# See `man tmux` for additional formatting options for the status line.
# The `format regular` and `format inverse` functions are provided as conveinences

# shellcheck disable=SC2128
if [ -z "$TMUX_POWERLINE_WINDOW_STATUS_CURRENT" ]; then
	TMUX_POWERLINE_WINDOW_STATUS_CURRENT=(
		"#[$(format regular)]"
		"$TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR"
		"#[$(format inverse)]"
		" #I#F "
		"$TMUX_POWERLINE_SEPARATOR_THIN"
		" #W "
		"#[$(format regular)]"
		"$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR"
	)
fi

# shellcheck disable=SC2128
if [ -z "$TMUX_POWERLINE_WINDOW_STATUS_STYLE" ]; then
	TMUX_POWERLINE_WINDOW_STATUS_STYLE=(
		"$(format regular)"
	)
fi

# shellcheck disable=SC2128
if [ -z "$TMUX_POWERLINE_WINDOW_STATUS_FORMAT" ]; then
	TMUX_POWERLINE_WINDOW_STATUS_FORMAT=(
		"#[$(format regular)]"
		" #I#{?window_flags,#F, } "
		"$TMUX_POWERLINE_SEPARATOR_THIN"
		" #W "
	)
fi

# shellcheck disable=SC1143,SC2128
if [ -z "$TMUX_POWERLINE_LEFT_STATUS_SEGMENTS" ]; then
	TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
		"mode_indicator"
		"tmux_session_info $aubergine $white"
		# "ifstat 30 255"
		# "ifstat_sys 30 255"
		# "lan_ip $sky_blue $thm_bg ${TMUX_POWERLINE_SEPARATOR_RIGHT_THIN}"
		# "wan_ip $sky_blue $thm_bg"
		# "vcs_branch $thm_gray"
		# "air ${TMUX_POWERLINE_SEG_AIR_COLOR} $thm_bg"
		#"vcs_compare 60 255"
		#"vcs_staged 64 255"
		#"vcs_modified 9 255"
		#"vcs_others 245 0"
	)
fi

# shellcheck disable=SC1143,SC2128
if [ -z "$TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS" ]; then
	TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
		# "earthquake 3 0"
		# "pwd terminal"
		# "macos_notification_count 29 255"
		# "mailcount 9 255"
		# "now_playing terminal $green"
		# "cpu $green CPU"
		# "load $aubergine $black"
        "disk_usage terminal $cyan"
        "tmux_mem_cpu_load terminal $aubergine"
		# "hostname terminal #ffff00"
        # "uptime $aubergine $black"
		# "battery $blue $thm_bg"
		#"weather 37 255"
		# "rainbarf 0 ${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR}"
		#"xkb_layout 125 117"
		# "date_day $teal $thm_bg"
		# "date $teal $thm_bg ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}"
		# "time $teal $thm_bg ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}"
		#"utc_time 235 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}"
	)
fi
