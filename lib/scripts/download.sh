#!/usr/bin/env bash
#
# Copyright (c) 2017 GATBLAU - www.gatblau.org
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
# Fetches all required packages and copies them to the ROOT folder
# Usage:
#    sh fetch.sh
#    sh fetch.sh clean (to clean the cache)
#

download() {
    # if the requested file does not exist in the root folder
    if [[ ! -e $ROOT$2 ]]; then
        # if a header string is specified for the download
        if [[ $3 ]]; then
            # download using the specified HTTP header
            wget --header "$3" -O $ROOT$2 $1$2
        else
            # download without an HTTP header
            wget -O $ROOT$2 $1$2
        fi
        if [[ $? != 0 ]]; then
            echo "ERROR: BROKEN LINK FOUND @ $1$2"
            echo "The build process cannot continue."
            echo "The likely cause of this is that the link was probably changed after the release was created."
            echo "Check that the latest master has corrected it."
            echo "If not, you need to update the fetch.sh file fixing the broken URI before trying again!"
            exit -1
        fi
    fi
}

# download from a URI but assign a different filename
download_as() {
    if [[ ! -e $ROOT$2 ]]; then
        wget -O $ROOT$2 $1
    fi
}

# download and unzips the mysql connector jar
download_mysql_connector() {
    ROOT=$1  # e.g. $1 = 'cache/'
    CONNECTOR_FILE=$2.tar.gz # e.g. $2 = mysql-connector-java-5.1.36
    if [[ ! -e $ROOT$CONNECTOR_FILE ]]; then
        wget -O $ROOT$CONNECTOR_FILE "http://dev.mysql.com/get/Downloads/Connector-J/$CONNECTOR_FILE"
        tar -zxf $ROOT$CONNECTOR_FILE -C $ROOT *.jar
        mv $ROOT$2/$2-bin.jar $ROOT
        rm -r $ROOT$2
    fi
}