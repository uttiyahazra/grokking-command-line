#Write a bash script to check existence of a file in current directory

#!/bin/bash
#Demonstrating the while loop
while [ -f ~/testfile ]
do
        echo "As of $(date), The file exists."
    sleep 4
done
echo "As of $(date), the file doesn't exist."