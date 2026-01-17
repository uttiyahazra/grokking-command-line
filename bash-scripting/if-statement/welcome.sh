# Write a conditional statement block in `/etc/profile` which displays a greeting message on screen upon login of "root", "uttiya" and "other user"

# /etc/profile: system-wide .profile file for the Bourne shell (sh(1))
# and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).
....
....
#Append the existing content of `/etc/profile` with following content

if [ "$USER" == "root" ]
then
    echo "***********************************************"
    echo "👑 Welcome, mighty root! Handle with care..."
    echo "***********************************************"
elif [ "$USER" == "uttiya" ]
then
    echo "Welcome Uttiya! Know that Linux is future-proof no bluff technology."
else
    echo "Welcome anonymous User!"
fi