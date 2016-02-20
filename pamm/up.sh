#!/usr/bin/env bash
#
# Copyright (c) 2016 GATBLAU - www.gatblau.org
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Starts the deployment of a blueprint.
# Usage:
#   sh up.sh [blueprint tag]
#   e.g.: to deploy the silver blueprint use "sh up.sh silver"
#

# if no blueprint tag is provided warn the user, show usage and exit the script
if [[ -z $1 ]]; then
   echo 'Missing blueprint tag.'
   echo 'Usage is:'
   echo '   sh up.sh [tag]'
   echo '   e.g.: sh up.sh silver'
   exit
fi

# load shell libraries
source scripts/remove.sh
source scripts/image.sh

# build the centos7 systemd image if not in the local registry
build_image ../lib/images/centos7d gatblau.org/centos 7d

# hack to relase handle on containers
echo restarting the docker daemon service, please wait!!!
sudo systemctl restart docker
source ~/.bash_profile

# check if existing containers exist and removes them
remove_by_name pamm-

# fetches any required packages
source ./fetch.sh

# starts the deployment using the specified inventory
ansible-playbook -vvvv -i blueprints/$1/inventory.txt blueprints/$1/playbook.yml