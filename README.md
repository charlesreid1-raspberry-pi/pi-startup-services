# pi-startup-services

Info and scripts for setting startup services on the raspberry pi.

## The Easy Way

The easy way to get startup services working on the Pi 
is to handle all of the logic in a single script,
and call that single script from your local list of startup services.
This list is in the `/etc/rc.local` file:

```
$ cat /etc/rc.local

#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.

/usr/bin/python /path/to/my/script.py

exit 0
```

This keeps it clean and simple.

(P.S. - search for "exit 0" and replace with "your code\nexit 0")

