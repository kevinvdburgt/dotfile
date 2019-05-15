#!/bin/bash

killall -q polybar

# BSPWM workspaces
i=1
for monitor in $(bspc query -M); do
  bspc monitor $monitor -n "${i}" -d "${i}.One" "${i}.Two" "${i}.Three" "${i}.Four"
  let i++
done
unset i

IFS=$'\n'
for MONITOR_QUERY in $(xrandr --query | grep -w connected | awk '/[[:digit:]]x[[:digit:]]+[[:digit:]]+[[:digit:]]/'); do
  MONITOR=$(echo $MONITOR_QUERY | cut -d" " -f1)

  # bspc monitor $monitor -d a b c d

  if [[ $MONITOR_QUERY == *"primary"* ]]; then
    MONITOR=$MONITOR polybar primary &
  else
    MONITOR=$MONITOR polybar secondary &
  fi
done

# for monitor in $(xrandr --query | grep " connected" | cut -d" " -f1); do


#   MONITOR=$monitor polybar main &
# done

# if type "xrandr"; then
#   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#     MONITOR=$m polybar --reload example &
#   done
# else
#   polybar --reload example &
# fi


# # BSPWM workspaces
# i=0
# for monitor in $(bspc query -M); do
#   bspc monitor $monitor -n "${i}" -d "One" "Two" "Three" "Four" "Five" "Six" "Seven" "Eight" "Nine"
#   let i++
# done
# unset i