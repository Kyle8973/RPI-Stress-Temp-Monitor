#!/bin/bash
# Github: Kyle8973

trap 'cleanup' INT

cleanup() {
    echo "Exiting program..."
    
    # Kill The Process Named Stress
    pkill stress

    exit 0
}

while :
do
    # Run The Stress Test In The Background
    stress -c 4 & # -c 4 Refers To All 4 Cores The Raspberry Pi 4 Has

    # Get The Process ID Of The Stress Process
    stress_pid=$!

    while true
    do
        # Display CPU Temp
        vcgencmd measure_temp

        # Sleep For 2 Seconds Then Output Temp Again
        sleep 2 # Change As Per Your Individual Needs
    done
done
