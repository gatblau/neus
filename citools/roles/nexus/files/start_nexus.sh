#!/usr/bin/env bash
cd /etc/init.d
chkconfig --add nexus
chkconfig --levels 345 nexus on
service nexus start
