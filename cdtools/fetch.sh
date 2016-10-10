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
# Fetches all required packages and copies them to the ROOT folder
# Usage:
#    sh fetch.sh
#    sh fetch.sh clean (to clean the chache)
#

source ./scripts/download.sh

ROOT='cache/'

# creates the root folder if it does not exist
if [[ ! -e $ROOT ]]; then
    mkdir -p $ROOT
fi

# removes rpms, zips and gz files from the root folder if 'clean' is passed as parameter to the shell script
if [[ $1 == "clean" ]]; then
    echo "Refreshing cache in progress...\n"
    rm $ROOT*.rpm && rm $ROOT*.zip && rm $ROOT*.gz && rm $ROOT*.jar && rm $ROOT*.hpi
fi

# removes all files with zero length size which were the result of previous failed downloads
find $ROOT. -size 0c -delete

# download the following files to the root folder if they do not exist
download "http://mirror.centos.org/centos/7/os/x86_64/Packages/" "unzip-6.0-15.el7.x86_64.rpm"
download "https://github.com/gogits/gogs/releases/download/v0.9.97/" "linux_386.zip"
download "https://sonatype-download.global.ssl.fastly.net/nexus/oss/" "nexus-2.13.0-01-bundle.zip"
download "http://download.oracle.com/otn-pub/java/jdk/8u102-b14/" "jdk-8u102-linux-x64.rpm" "Cookie: oraclelicense=accept-securebackup-cookie"
download "http://dl.fedoraproject.org/pub/epel/7/x86_64/e/" "epel-release-7-8.noarch.rpm"
download "http://opensource.wandisco.com/centos/7/git/x86_64/" "perl-Git-2.4.1-1.WANdisco.259.noarch.rpm"
download "http://mirror.centos.org/centos/7/os/x86_64/Packages/" "perl-5.16.3-286.el7.x86_64.rpm"
download "http://opensource.wandisco.com/centos/7/git/x86_64/" "wandisco-git-release-7-1.noarch.rpm"
download "http://opensource.wandisco.com/centos/7/git/x86_64/" "git-2.4.1-1.WANdisco.259.x86_64.rpm"
