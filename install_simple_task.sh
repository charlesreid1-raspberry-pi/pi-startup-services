#!/bin/bash
# Adding a new entry to rc.local:
# Changing the end of /etc/rc.local to:
# /usr/bin/python /path/to/my/script.py

# python binary
export PYB="/usr/bin/python"

# startup script
export SCR="/root/codes/pi-aircrack-batch/AircrackIntervals.py"

export LINE="${PYB} ${SCR}"

echo "------"
echo "Adding the following line to /etc/rc.local:"
echo "${LINE}"

# This should only create a .bak if it finds a result.
sed -i.bak "s'exit 0''" /etc/rc.local
echo "${LINE}" >> /etc/rc.local

echo "------"
echo "New /etc/rc.local:"
cat /etc/rc.local
