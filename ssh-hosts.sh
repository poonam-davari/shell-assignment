#!/bin/bash

USER_NAME="compose"  								# username which should be present on each machine where you want to apply this script
USER_PASS="Canopy1!"								# password of host machine from which you are running this script

hosts=compose-amp.compose.canopy-cloud.com,amp-ldap.compose.canopy-cloud.com 	# defined hosts variable which takes comma separated values of hostnames



echo "Following are the hostnames where we are going to login"
for i in $(echo $hosts | sed "s/,/ /g")						# Looping over the list of hostnames provided
do
    echo "$i"									# Print each hostname
done

############ connecting servers #########


echo "Take command input"
echo "enter command to run on all hosts" 
read COMMAND 									# Input command to run on all hosts

echo "starting ssh connection"

ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa					# generate ssh keys

for i in $(echo $hosts | sed "s/,/ /g")						# Looping over the list of hostnames specified
do
    ssh-copy-id -i ~/.ssh/id_rsa.pub $USER_NAME@$i #"echo $ssh_key >> ~/.ssh/authorized_keys"   # copy public ssh key to hosts
    ssh $USER_NAME@$i $COMMAND									# run command on hosts

done









