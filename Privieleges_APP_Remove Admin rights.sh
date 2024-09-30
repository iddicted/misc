
#!/bin/bash

#getting the current users name
currentuser=`stat -f "%Su" /dev/console`

#substituting as user stored in variable to modify plist
su "$currentuser" -c "/Applications/Privileges.app/Contents/Resources/PrivilegesCLI --remove"
