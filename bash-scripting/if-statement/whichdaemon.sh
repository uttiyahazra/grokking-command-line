# Write a bash script `whichdaemon.sh` that checks if an entered daemon is currently running on system and generates an output. iF 
# the daemon is running, then return the pid of the daemon.

#!/bin/bash
echo "Enter your daemon name: "
read daemon

#Executing pgrep command to grab the pid of the daemon
pgrep -x $daemon

if [[ $? -eq 0 ]]
then
    echo "The entered daemon $daemon is running on system with pid(s) $(pgrep -x $daemon)."
else
    echo "The entered daemon $daemon isn't currently running on system."
fi