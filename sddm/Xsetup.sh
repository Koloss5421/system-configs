#!/bin/sh
# /usr/share/sddm/scripts/Xsetup
# Xsetup - run as root before the login dialog appears


###########################################
## MSI Laptop Setup For Two Ext Monitors ##
###########################################
## Check to see if the Real HDMI cable is plugged in.
isConnected="$(xrandr -q | grep "HDMI-2 connected")"
if [ -n "$isConnected" ]; then
        # Get the native resolution from xrandr
        mode="$(xrandr -q | grep -A1 "HDMI-2 connected" | tail -1 | awk '{ print $1 }')"
        # Turn off the onboard screen
        xrandr --output eDP-1 --off
        #Make the HDMI-2(Real HDMI) the primary display
        xrandr --output HDMI-2 --primary --mode $mode
        ## Chec to see if the mini-display port is connected
        isConnected="$(xrandr -q | grep "HDMI-2 connected")"
        if [ -n "$isConnected" ]; then
                mode="$(xrandr -q | grep -A1 "HDMI-1 connected" | tail -1 | awk '{ print $1 }')"
                # Move the monitor to the left and center it on the left side 
                xrandr --output HDMI-1 --mode $mode --pos 0x90
        fi
fi
