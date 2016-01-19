#!/usr/bin/env bash
#
# Removes one or more containers which name starts with the specified string
# Usage:
#   from the terminal: e.g. to remove containers starting with 'host_' use
#      source ./remove.sh
#      remove_by_name host_
#
remove_by_name() {
    # gets the ids of the containers starting with the specified name
    id=$(docker ps -f name=$1* -q)

    # if containers are found
    if [[ ! -z $id ]]; then
       # removes the found containers
       echo 'Previous containers found. They will be removed.'
       echo 'Removing the containers with Id:'
       docker rm -f $id
    else
       # warns no containers were found
       echo 'No previous containers were found.'
    fi
}
