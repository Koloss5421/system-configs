#!/bin/sh
# /usr/share/sddm/scripts/Xsetup
# Xsetup - run as root before the login dialog appears


###########################################################
## MSI Laptop Setup For Two Ext Monitors Through MST Hub ##
###########################################################
## Check to see if the Real HDMI cable is plugged in.
isConnected="$(xrandr -q | grep "DP-1-1 connected")"
if [ -n "$isConnected" ]; then
        # Get the native resolution from xrandr
        mode="$(xrandr -q | grep -A1 "DP-1-1 connected" | tail -1 | awk '{ print $1 }')"
        # Turn off the onboard screen
        xrandr --output eDP-1 --off
        #Make the HDMI-2(Real HDMI) the primary display
        xrandr --output DP-1-1 --primary --mode $mode
        ## Chec to see if the mini-display port is connected
        isSecConnected="$(xrandr -q | grep "DP-1-3 connected")"
        if [ -n "$isSecConnected" ]; then
                secMode="$(xrandr -q | grep -A1 "DP-1-3 connected" | tail -1 | awk '{ print $1 }')"
                # Move the monitor to the left and center it on the left side 
                xrandr --output DP-1-3 --mode $secMode --left-of DP-1-1
        fi
fi
