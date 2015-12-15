#!/usr/bin/env bash

# creates the files symbolic link if it does not exist
if [[ ! -e files ]]; then
    ln -s ../../../files files
fi

# creates the group_vars symbolic link if it does not exist
if [[ ! -e group_vars ]]; then
    ln -s ../../../group_vars group_vars
fi

# creates the plays symbolic link if it does not exist
if [[ ! -e plays ]]; then
    ln -s ../../../plays plays
fi

# creates the roles symbolic link if it does not exist
if [[ ! -e roles ]]; then
    ln -s ../../../roles roles
fi

# fetch installation files
bash ../fetch.sh

# build CI environment
ansible-playbook run.yml
