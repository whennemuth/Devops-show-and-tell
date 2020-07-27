#!/bin/bash

# Script creates a new account on a docker instance server.

# This step needs to be run first on *both* server instances.

# Shell into Docker to run this script on each server using...
#    docker exec -ti ssh-daemon_1 bash 

# Install 'sudo' for Centos as it is needed later in the script. 
apt-get update 
apt-get install sudo 

# Create a new user account with home directory and a default password 'dph'.
useradd -m dph

# Pipe user:password to change account password within script and prevent a prompt. 
echo "dph:dph" | chpasswd 

# Setup ssh directory in new user account with generated key-pair. 
mkdir -p -m700 /home/dph/.ssh

# Change ownership of all files within user directory
chown -R dph:dph /home/dph 

# Generate an ssh key-pair for the new account as that user.
sudo -u dph ssh-keygen -t rsa -N "" -f /home/dph/.ssh/id_rsa

exit 