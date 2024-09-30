#!/bin/sh
# Checks if filevault is enalbed.
# If not enable it
# Author: @iddicted


currentFWStatus="${sudo fdesetup status}" 
filevaultENABLED="FileVault is On."
currentUser=$(scutil <<< "show State:/Users/ConsoleUser" | awk '/Name :/ { print $3 }')

# enable if not enabled
if [[ $currentFWStatus = $filevaultENABLED]]; then # check if already enabled
    echo "fileVault is already enabled, no action required"
    exit 1
else # if not enabled
    echo "Filevault is disabled, enforcing filevault now."
    # enable filevault command
    sudo fdesetup enable
    # determine encryption progress
    encryptionProgress="${diskutil apfs list | grep "Conversion Progress"}"
    enryptionRunning="not running"
    if [[ $encryptionProgress != "" ]]; then
        enryptionRunning="running"
        while $encryptionProgress = "running"; do
        sleep 5
        done
    else
        # check again if filevault has been enabled correctly
        if [[ $currentFWStatus = $filevaultENABLED]]; then
        echo "fileVault has been succesfully enabled"
        sudo jamf recon
        exit 2
fi 