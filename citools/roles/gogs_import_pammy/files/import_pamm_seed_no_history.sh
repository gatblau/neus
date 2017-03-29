#!/usr/bin/env bash
git config --global push.default matching
git config --global user.name gogs
git config --global user.email gogs@devops.net

# Import cloned PAMM seed into GOGS
cd /home/gogs/gogs-repositories/pamm.seed
rm -rf .git
git init
git add .
git commit -m "PAMM seed initial commit."
git remote add origin http://gogs:gogs@localhost:3000/gogs/pamm.seed.git
git push -u origin master

chown -R gogs:gogs /home/gogs/gogs-repositories/pamm.seed
