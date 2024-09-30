#!/bin/bash
# Author: @iddicted
# Remove Microsoft AutoUpdate application
if [ -d "/Library/Application Support/Microsoft/MAU2.0/Microsoft AutoUpdate.app" ]; then
    sudo rm -rf "/Library/Application Support/Microsoft/MAU2.0/Microsoft AutoUpdate.app"
    echo "Microsoft AutoUpdate.app deleted."
else
    echo "Microsoft AutoUpdate.app already deleted."
fi

# Remove Microsoft AutoUpdate LaunchDaemon
if [ -f "/Library/LaunchDaemons/com.microsoft.autoupdate.helper.plist" ]; then
    sudo rm -rf "/Library/LaunchDaemons/com.microsoft.autoupdate.helper.plist"
    echo "com.microsoft.autoupdate.helper.plist deleted."
else
    echo "com.microsoft.autoupdate.helper.plist already deleted."
fi

# Remove Microsoft Update Agent LaunchAgent
if [ -f "/Library/LaunchAgents/com.microsoft.update.agent.plist" ]; then
    sudo rm -rf "/Library/LaunchAgents/com.microsoft.update.agent.plist"
    echo "com.microsoft.update.agent.plist deleted."
else
    echo "com.microsoft.update.agent.plist already deleted."
fi

# Remove Microsoft AutoUpdate Helper
if [ -f "/Library/PrivilegedHelperTools/com.microsoft.autoupdate.helper" ]; then
    sudo rm -rf "/Library/PrivilegedHelperTools/com.microsoft.autoupdate.helper"
    echo "com.microsoft.autoupdate.helper deleted."
else
    echo "com.microsoft.autoupdate.helper already deleted."
fi
s