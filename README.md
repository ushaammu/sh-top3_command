# sh-top3_command
This script continuously monitors system performance by displaying the top three CPU-consuming processes every second for a total duration of two minutes. It begins by defining the duration, interval, and a counter to track elapsed time. Inside a while loop, the script prints the current time and then uses the ps command with sorting options to list processes consuming the highest CPU. The head command is used to display only the header and top three entries. After each iteration, the script pauses for one second and updates the counter. This provides a simple but effective way to observe real-time CPU usage patterns.

Step-by-step explanation

Shebang

#!/bin/bash


Tells the system to run the script with Bash.

Set variables

DURATION=120
INTERVAL=1
SECONDS_PASSED=0


DURATION = total run time in seconds (120 → 2 minutes).

INTERVAL = delay between samples (1 second).

SECONDS_PASSED = counter that tracks elapsed time (starts at 0).

Intro message

echo "Fetching top 3 CPU-consuming processes every second for 2 minutes..."


Prints a short informational message to the terminal.

Start loop condition

while [ $SECONDS_PASSED -lt $DURATION ]; do


Begins a loop that repeats as long as SECONDS_PASSED is less than DURATION. This controls how long the script runs.

Print timestamp

echo "---- Time: $(date +"%T") ----"


Prints the current time (HH:MM:SS). $(date +"%T") runs the date command and inserts the time into the output.

Get top CPU processes

ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 4


ps -eo pid,ppid,cmd,%cpu lists processes showing: PID, parent PID, command, and CPU%.

--sort=-%cpu sorts processes by CPU usage in descending order (highest first).

head -n 4 takes the first 4 lines: typically the header line plus the top 3 processes. That gives you the top-3 processes with column names.

Blank line for readability

echo


Adds a blank line to separate iterations visually.

Wait and increment timer

sleep $INTERVAL
SECONDS_PASSED=$((SECONDS_PASSED + INTERVAL))


sleep $INTERVAL pauses the script for 1 second.

SECONDS_PASSED=$((...)) increases the elapsed-time counter by the interval.

End loop

done


Closes the while loop. The script repeats steps 5–8 until the total duration is reached.

How to run

Save the script (e.g., run_top.sh).

Make it executable:

chmod +x run_top.sh


Run:

./run_top.sh

Example snippet of output
---- Time: 14:22:05 ----
  PID  PPID CMD                         %CPU
 2345  1    /usr/bin/firefox            25.3
 1123  1    /usr/bin/gnome-shell        10.8
 6789  1    /usr/bin/python3             7.2
