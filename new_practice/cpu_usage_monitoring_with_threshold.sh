#!/bin/bash
process_name= $1
threshold=50
pid=$(ps aux | grep "$process_name" | grep -v grep | aws '{pri
nt $2}')
if [ -z "$pid" ]; then
    echo "Process not found."
else
    cpu_usage=$(ps -p "$pid" -o %cpu | awk -F. '{print $1}' )
    echo "Current CPU usage of $process_name (PID $pid): $cpu_usage%"

    if [ "$cpu_usage" -gt "$threshold" ]
        echo "CPU usage exceeds threshold. Terminating process..."
        kill "$pid"
        echo "Process terminated."
    else
        echo "CPU usage within threshold."
    fi
fi