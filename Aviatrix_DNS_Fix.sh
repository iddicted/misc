#! /bin/sh
##############################################################################
# This script edits the /etc/hosts file to create compatibility for aviatrix when using a fritzbox
# The Script checks if the required configuration has already been done
# If already configured it will display a notification window
# If configuration is missing, it will write and append the line to the file
#
# Author: @iddicted

function already_configured() {
    "/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfhelper" \
    -windowType "hud" \
    -heading "Aviatrix already configured" \
    -description "Your Mac is already configured correctly. Please contact the Somebody team if aviatrix still doesn't work correctly." \
    -button1 "Okay" \
    -icon /System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/ToolbarInfo.icns \
    -iconSize "256" \
    -alignDescription "center" \
    -alignHeading "center" &
}

function config_done() {
    "/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfhelper" \
    -windowType "hud" \
    -heading "Aviatrix has been configured" \
    -description "Aviatrix compatibility has now been setup. Please contact the Somebody team if aviatrix still doesn't work correctly." \
    -button1 "Okay" \
    -icon /System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/ToolbarInfo.icns \
    -iconSize "256" \
    -alignDescription "center" \
    -alignHeading "center" & 
}

# Check if config already exists in file
grep -q "127.0.0.1 localhost.aviatrix.com" /etc/hosts
if [ $? -eq 0 ]; then
  # The line already exists, print a message and dialog
  echo "The line '102.0.0.1 aviatrix' already exists in the hosts file."
  already_configured
  

else
  # The line does not exist, add it to the file
  echo "127.0.0.1 localhost.aviatrix.com" >> /etc/hosts
  config_done
fi