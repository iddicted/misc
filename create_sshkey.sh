#!/bin/sh

# Get the sshkeyName from the first script argument
sshkeyName="$1"
# Check if an argument was provided
if [ -z "$sshkeyName" ]; then
  echo "Error: No argument provided"
  echo "Usage: $0 <sshkeyName>"
  exit 1
fi

# Generate ssh key without passphrase
ssh-keygen -t rsa -f ~/.ssh/$sshkeyName -N ""
# copy public key to clipboard
pbcopy < ~/.ssh/$sshkeyName.pub
# paste into new file on desktop
pbpaste > ~/Desktop/$sshkeyName.txt

echo "SSH key '$sshkeyName' generated and public key copied to clipboard. File '$sshkeyName.txt' created on Desktop "
