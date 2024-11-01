#!/bin/bash
mkfs -t xfs /dev/vdb
mkdir -p /data/share
echo "/dev/vdb  /data/share xfs defaults,nofail 0 2" >> /etc/fstab
mount /data/share
chown centos:centos -R /data/share
echo "/data/share *(rw,sync,no_root_squash)" >> /etc/exports
systemctl enable nfs-server
systemctl start nfs-server
exportfs -avr
