#!/usr/bin/env bash

# if no tag is provided warn the user, show usage and exit the script
if [[ "$#" -ne 1 ]]; then
   echo 'Missing tag.'
   echo 'Usage is:'
   echo '   sh run.sh [tag]'
   echo '   e.g.: sh run.sh upload'
   exit
fi

ansible-playbook -i inventory site.yml --tags=$1
