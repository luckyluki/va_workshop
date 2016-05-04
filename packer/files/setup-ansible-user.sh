#!/bin/bash

echo "$ANSIBLE_USER:$ANSIBLE_PW" >> /tmp/packer.out
echo "$ANSIBLE_PUBKEY" >> /tmp/packer.out

# creating user for ansible
useradd $ANSIBLE_USER
# allowing $ANSIBLE_USER to perform sudo without retyping password
echo "$ANSIBLE_USER  ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
# change password for $ANSIBLE_USER
echo $ANSIBLE_USER:$ANSIBLE_PW | chpasswd

# becoming $ANSIBLE_USER
# inserting public key for ssh login
if [ ! -d /home/$ANSIBLE_USER/.ssh ]; then
    mkdir /home/$ANSIBLE_USER/.ssh
    chown ansible:ansible /home/$ANSIBLE_USER/.ssh
    chmod 700 ~/.ssh
fi
echo $ANSIBLE_PUBKEY >> /home/$ANSIBLE_USER/.ssh/authorized_keys
