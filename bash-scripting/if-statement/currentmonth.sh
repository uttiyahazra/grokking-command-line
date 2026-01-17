# Use an if/then/elif/else construct that prints information about the current month. The script should print the number of days in this month, and give information about leap years if the current month is February.

#!/bin/bash
current_month=$(date +%m)
current_year=$(date +%Y)
if [[ $current_month -eq "1"|| $current_month -eq "3" || $current_month -eq "5" || $current_month -eq "7" || $current_month -eq "8" || $current_month -eq "10" || $current_month -eq "12" ]]
then
    echo "Current Month contains 31 days."
    exit 0
elif [[ $current_month -eq "2" ]]
then
    echo "This is February Month."
    if [[ $(($current_year % 400)) -eq "0" || $((current_year % 4)) -eq "0" ]]
    then
        echo "This is a Leap Year. Hence February Month contains 29 days this year."
        exit 0
    fi
else
    echo "Current Month contains 30 days."
    exit 0
fi