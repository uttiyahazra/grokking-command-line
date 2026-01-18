#Write a bash script where user enters a folder within which the `yaml` files older than 365 days (1 year) will be removed 

#!/bin/bash
echo "Enter the directory name to look for: "
read folder
echo "Yaml files less than 365 days (1 year) older will be removed."
older_file=$(find $folder -maxdepth 1 -type f -mtime +365 -iname "*.yaml" -exec ls {} +)

#Iteate over older files with for loop
for file in $older_file
do
    rm $file
done

echo "Deletion of Yaml files less than 1 Year older are done."