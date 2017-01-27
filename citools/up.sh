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
# Manages the execution of roles on a docker container.
# The only part of this playbook that needs changing is the list of roles as described below.
# The name of the playbook should be updated to reflect the host name - e.g. database.yml
#

#
# Starts the deployment of a blueprint.
# Usage:
#   sh up.sh [blueprint tag]
#   e.g.: to deploy the silver blueprint use "sh up.sh silver"
#

# if no blueprint tag is provided warn the user, show usage and exit the script
if [[ "$#" -ne 2 ]]; then
   echo 'Missing tag and blueprint.'
   echo 'Usage is:'
   echo '   sh up.sh [tag] [blueprint]'
   echo '   e.g.: sh up.sh silver silver'
   exit
fi

# fetches any required packages
source ./fetch.sh

# starts the deployment using the specified inventory
startTime=$(date -u +"%s")

ansible-playbook -i inventories/$1 site.yml --tags=$1 --extra-vars "blueprint=$2" --skip-tags=$3 | tee citools.log

endTime=$(date -u +"%s")
diff=$(($endTime-$startTime))

echo $os "CI Tools $1 build process complete: it took $(($diff / 60)) minutes and $(($diff % 60)) seconds."
