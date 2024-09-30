#!/bin/bash
################################################################################
# This script is used to check if admin account.
# If not, prompt to enable privileges using sap privileges app
# If admin account enable, launch Erase Assistant
# Author: @iddicted
################################################################################



# Variables
UserName="$(/usr/bin/defaults read /Library/Preferences/com.apple.loginwindow lastUserName)"
jamfHelper="/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper"
helper_icon="/System/Library/CoreServices/Diagnostics Reporter.app/Contents/Resources/AppIcon.icns"


################################################################################
# Check if user is admin
if groups $UserName | grep -q -w admin; 
then 
    echo "Is admin"; 
else 
    echo "Not admin"; 
   "$jamfHelper" -windowType hud -lockhud -title "Admin Account Required" -description "Please use 'Privileges' app to elevate your permissions and try again." -icon "$helper_icon" &
   echo "Could not continue, admin permissions required"
   sleep 5
   /usr/bin/open -b "corp.sap.privileges" &
   exit 1;

fi


echo ""
echo "Launching Erase assistant."
/usr/bin/open /System/Library/CoreServices/Erase\ Assistant.app &

exit 0