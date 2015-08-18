#!/usr/bin/env bash
yum -y install sudo
sed 's/requiretty/\!requiretty/' /etc/sudoers > /etc/sudoers
