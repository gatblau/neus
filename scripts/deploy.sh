#!/usr/bin/env bash

# Edit inventory file
vi /data/neus/plays/roles/inventory.txt

# Deploy CI Compact (bronze)
cd /data/neus/plays
ansible-playbook book-ci-compact.yml -i roles/inventory.txt -u root -k