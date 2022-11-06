#!/bin/sh

# Commands to be able to properly use the touchpad

xinput set-prop 18 "libinput Tapping Enabled" 1
xinput set-prop 18 312 1 
synclient TapButton1=1
synclient HorizTwoFingerScroll=1
synclient VertScrollDelta=-95
synclient HorizScrollDelta=-95
synclient TapButton2=3

# Configure the hotkey to change keyboard layout
setxkbmap us,ru -option 'grp:alt_shift_toggle'

# Configure Xrandr for 3 monitors
monitorsv3

# Set the wallpaper
feh --bg-fill ~/dotfiles/background.jpg

# Start Picom compositor
# picom &

# Start Dunst notification daemon
dunst &

# Start fusuma to be able to multitouch gestures
fusuma &
