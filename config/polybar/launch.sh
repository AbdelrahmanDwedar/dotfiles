#!/usr/bin/env bash

# Terminate already running bar instances
polybar-msg cmd quit

# Launch the three islands
echo "---" | tee -a /tmp/polybar_left.log /tmp/polybar_center.log /tmp/polybar_right.log
polybar left 2>&1 | tee -a /tmp/polybar_left.log & disown
polybar center 2>&1 | tee -a /tmp/polybar_center.log & disown
polybar right 2>&1 | tee -a /tmp/polybar_right.log & disown

echo "Bars launched..."
