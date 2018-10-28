#!/bin/sh
# `/sbin/setuser memcache` runs the given command as the user `memcache`.
# If you omit that part, the command will be run as root.
exec su skokada -c "python3 /home/skokada/app/app.py" >>/var/log/pythonserver.log 2>&1