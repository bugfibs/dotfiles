#!/usr/bin/env bash

# Kill existing polybar
pkill polybar

# Small delay
sleep 1

# Launch polybar
polybar main &
