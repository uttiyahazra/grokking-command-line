# Write a script that takes exactly one argument, a directory name. If the number of arguments is more or less than one, print a usage message. If the argument is not a directory, print another message. 
# For the given directory, print the five biggest files and the five files that were most recently modified.

#!/bin/bash
if [[ $# -ne 1 ]]
then
    echo "Please enter exactly one argument (fully qulaified directory name)."
    exit 1
elif [[ ! -d "$1" ]]
then
    echo "You have not entered a valid directory."
elif [[ -d "$1" ]]
then
    echo "You've entered a valid directory."

    echo "The five biggest files in entered directory are: "
    for five_biggest_files in $(ls -lS "$1"|head -n 5|awk '{print $9}')
    do
        echo "$five_biggest_files"
    done

    echo "The five most recent used files are: "
    for five_most_recent_used_files in $(ls -lt "$1"|head -n 5|awk '{print $9}')
    do
        echo "$five_most_recent_used_files"
    done
fi