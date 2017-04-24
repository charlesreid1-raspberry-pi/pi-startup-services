#!/bin/bash
# Adding a new entry to rc.local:
# Changing the end of /etc/rc.local to:
# /usr/bin/python /path/to/my/script.py

# python binary
export PYB="/usr/bin/python"

# startup script
export SCR="/root/codes/pi-aircrack-batch/AircrackIntervals.py"

export LINE="${PYB} ${SCR}"
#export LINE2="/usr/bin/stunnel /etc/stunnel/stunnel.conf"

echo "------"
echo "Adding the following lines to /etc/rc.local:"
echo "${LINE}"
#echo "${LINE2}"
echo "------"

# This should only create a .bak if it finds a result.
sed -i.bak "s'exit 0.*''" /etc/rc.local

# check if the lines are already there
#for L in "${LINE}" "${LINE2}"
for L in "${LINE}" 
do
	# if the line is already there, don't add it.
	echo "Checking if the line we are adding to rc.local is already there."
	echo "$(grep -c "${L}" /etc/rc.local)"
	if [[ "$(grep -c "${L}" /etc/rc.local)" == "0" ]]; then
		echo "${L}" >> /etc/rc.local
	fi
done

echo "------"
echo "New /etc/rc.local:"
cat /etc/rc.local
echo "------"
