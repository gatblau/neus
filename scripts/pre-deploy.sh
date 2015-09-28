#!/usr/bin/env bash

# Open port 80
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --reload

# Create Vagrant User
/usr/sbin/groupadd -g 501 vagrant
/usr/sbin/useradd vagrant -u 501 -g vagrant -G wheel
echo "vagrant"|passwd --stdin vagrant
echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant

# Install tools for deployment
yum install epel-release
yum install ansible
yum install sshpass

# Clone NEUS from GitHub
cd /data
git clone http:/github.com/iturner/neus

# Fetch files for deployment
cd /data/neus
sh ./fetch.sh
