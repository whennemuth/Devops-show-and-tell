#!/bin/bash

# Script copies ssh public key to the same user account on the other server.

# User account must be setup on the other server *first* before running this script. 

# Shell into Docker to run this script on each server using...
#    docker exec -ti ssh-daemon_1 bash 

# Install 'sshpass' to later allow a password to be sent to ssh login within the script.
apt-get install sshpass -y

# Copy the ssh public key to the user account on the other server.
sshpass -p "dph" ssh-copy-id -i /home/dph/.ssh/id_rsa.pub dph@172.17.0.1 -p32769  # server 2 

# Create a bash_profile for the user to contain an alias for logging into server 2 
echo 'alias sshserver2="ssh dph@172.17.0.1 -p 32769"' >> /home/dph/.bash_profile 
chmod 655 /home/dph/.bash_profile 
chown dph:dph /home/dph/.bash_profile 

echo "Account dph has ssh access to server2. Switch user accounts using 'su - dph' then issue alias 'sshserver2'." 

exit 