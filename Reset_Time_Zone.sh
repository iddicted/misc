#!/bin/bash
# Author: @iddicted
# Check if the script is run with sudo
if [[ $EUID -ne 0 ]]; then
    echo "Please run this script with sudo."
    exit 1
fi

# Command to remove the specified file
sudo rm /var/db/timed/com.apple.timed.plist

# Check if the command was successful
if [ $? -eq 0 ]; then
    echo "File removed successfully."
else
    echo "Error: Unable to remove the file."
fi
