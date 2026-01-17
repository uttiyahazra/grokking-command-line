#Demonstrating the if-else logic in bash to determine the existence of the program & installing it, if needed.

#!/bin/bash

echo "Enter your wished program: "
read program

#start of if-else block with double square brackets for bash extended tests
if [[ -f "/usr/bin/$program" ]]
then
    "Entered program is already installed, executing it ..."
else
    sudo apt update && sudo apt install -y $program
fi

#Executing the program
echo "executing the program..."
$program