#!/usr/bin/env bash
yum -y remove libreoffice*
yum -y clean all
rm -rf VBoxGuestAdditions_*.iso

