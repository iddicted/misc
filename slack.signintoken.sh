#!/bin/sh
## postinstall

# This script copies the file "Signin.slacktoken" to user folders
# It copies it to two different folders
# One is for the Appstore version of the app store, and the other is for the direct download version of Slack

# Defining the current logged-in user
currentUser=$(scutil <<< "show State:/Users/ConsoleUser" | awk '/Name :/ { print $3 }')

# Direct download version
directDownloadVersion="/Users/$currentUser/Library/Application Support/Slack"
mkdir -p "$directDownloadVersion"
chown -R "$currentUser" "$directDownloadVersion"
cp /var/tmp/Signin.slacktoken "$directDownloadVersion/Signin.slacktoken"
sleep 1

# Appstore Version
appStoreVersion="/Users/$currentUser/Library/Containers/com.tinyspeck.slackmacgap/Data/Library/Application Support/Slack"
mkdir -p "$appStoreVersion"
chown -R "$currentUser" "$appStoreVersion"
cp /var/tmp/Signin.slacktoken "$appStoreVersion/Signin.slacktoken"
