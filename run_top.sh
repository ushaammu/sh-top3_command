#!/bin/bash

ITER=24          # run 24 times
INTERVAL=1       # 1 second interval
LOGFILE="log.txt"

echo "Collecting top 3 CPU processes for 24 seconds..." > "$LOGFILE"
echo "Start Time: $(date)" >> "$LOGFILE"
echo "----------------------------------------" >> "$LOGFILE"

for ((i=1; i<=ITER; i++))
do
    echo "---- Timestamp: $(date +"%T") ----" >> "$LOGFILE"
    ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 4 >> "$LOGFILE"
    echo >> "$LOGFILE"
    sleep $INTERVAL
done

echo "Completed. Output saved to $LOGFILE"
