#Write a bash script that checks all logfiles in user's home directory, if they are more than 90 days older. If yes, then these log
#files will be moved to a folder called `archivedlogfiles` and will be compressed using a `tar` command there. Afterwards the log files
# in older location (users's home directory) must be removed

#!/bin/bash

#Creating a folder "archivedlogfiles" in current user's home directory
mkdir -p ~/archivedlogfiles && chmod -R 755 ~/archivedlogfiles

for file_to_archive in $(find ~ -maxdepth 1 -iname "*.log" -mtime +90 -exec ls {} +)
do
    mv "$file_to_archive" ~/archivedlogfiles
    tar -cvf ~/archivedlogfiles/"$file_to_archive".tar.gz -C ~/archivedlogfiles "$file_to_archive"
    sleep 10
    rm ~/"$file_to_archive"
done