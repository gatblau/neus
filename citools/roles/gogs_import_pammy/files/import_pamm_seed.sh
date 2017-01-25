#!/usr/bin/env bash
git config --global push.default matching

# Import cloned PAMM seed into GOGS
cd /home/gogs/gogs-repositories/pamm.seed
git remote set-url origin http://gogs:gogs@localhost:3000/gogs/pamm.seed.git
git push -u origin master
