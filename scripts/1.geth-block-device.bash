#!/bin/bash
# device name does not seem to be deterministic for the chosen AMI
# this way it kind of works...
DEVICE_NAME=$(lsblk | grep "100G" | awk '{ print $1 }')

sudo mkfs -t ext4 /dev/$DEVICE_NAME
sudo mkdir /opt/ethereum
sudo mount /dev/$DEVICE_NAME /opt/ethereum
echo /dev/$DEVICE_NAME  /opt/ethereum ext4 defaults,nofail 0 0 | sudo tee --append /etc/fstab
sudo mount -a
sudo chown -R ubuntu:ubuntu /opt/ethereum/
ln -s /opt/ethereum /home/ubuntu/.ethereum
