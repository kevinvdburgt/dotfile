#!/bin/bash

## Load all fonts
xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/misc
xset fp rehash

## Xorg settings
xrdb -merge $HOME/.Xresources
xsetroot -cursor_name left_ptr
wmname LG3D

## Keyboard remapping
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl
setxkbmap -option caps:escape

## Start some background tasks
#udiskie &
#pulseaudio &
#mpd &
#mpdscribble &
#mopidy &

exec bspwm

