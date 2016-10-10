#!/usr/bin/env bash

# creates a new physical volume for the registry storage
# initialises a partition as an LVM physical volume for later use as part of an LVM logical volume
pvcreate /dev/sdb

# add the physical volume to the vg_root volume group
vgextend vg_root /dev/sdb

# create a 15 Gb logical volume for the registry mapped to the vg_root
lvcreate -n lv_registry -L 15G vg_root

# create an XFS file system
mkfs.xfs /dev/vg_root/lv_registry

# check if partitions and storage devices have been created
#vi /etc/fstab

# mount all the filesystems mentioned in /etc/fstab
mount -a

# grows the root filesystem and sets up storage for Docker
docker-storage-setup
