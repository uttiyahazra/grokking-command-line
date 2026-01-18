#Write a bash script in which a user gets to choose only 4 technologies out of a few items. 
#When this count is exceeded, the script greets the user with an sign-off message.

#!/bin/bash
counter=0
while [[ $counter -lt 4 ]]
do
    echo "Enter techstack of your choice: "
    #Interactuve menu for techstack selection
    echo "1 - Jenkins"
    echo "2 - GitHub Actions/GitLab"
    echo "3 - Ansible"
    echo "4 - Terraform"
    echo "5 - Bash"
    echo "6 - Python"
    echo "7 - Java"

    #read the user-input
    read techstack

    #initiating a case statement
    case $techstack in
        1) echo "Jenkins is evergreen, Good choice.";;
        2) echo "GitHub Actions/GitLab is booming now.";;
        3) echo "Ansible is best friend in Config Management.";;
        4) echo "Terraform is God of Cloud Infra Provisioning.";;
        5) echo "Bash can be entrusted like an old Grandfather.";;
        6) echo "Python can be the only programming language someone might be interested to learn nowadays.";;
        7) echo "Nearly 4 billion devices still run on Java today.";;
        *) echo "Invalid input. But there are many more technologies out there.";;
    esac
    counter=($counter+1)
done

echo "Thanks for choosing 4 technologies from given techstack menu."