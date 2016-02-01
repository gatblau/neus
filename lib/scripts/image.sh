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
# A library for building docker images
# source image.sh
#

#
# Builds a docker image if it is not in the local docker registry
# Usage:
#    build_image $1 $2
#      where:
#        $1 : relative directory where the docker file to build the image is located
#        $2 : image repository
#        $3 : image tag
#    e.g.: build_image ../lib/images/centos7d gatblau.org centos7d
#
build_image() {
    # if docker image $1 does not exist in the local registry
    if [ "$(echo $(docker images) | grep -c "$2.*$3")" != '1' ]; then
      echo "Could not find image '$2:$3', starting build process using docker file in directory '$1'."
      docker build --rm -t $2:$3 $1
    fi
}