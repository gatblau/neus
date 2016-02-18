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
download "https://sonatype-download.global.ssl.fastly.net/nexus/oss/" "nexus-2.12.0-01-bundle.zip"
download "http://download.oracle.com/otn-pub/java/jdk/8u74-b02/" "jdk-8u74-linux-x64.rpm" "Cookie: oraclelicense=accept-securebackup-cookie"
download "https://services.gradle.org/distributions/" "gradle-2.7-bin.zip"
download "https://dl.bintray.com/sbt/native-packages/sbt/0.13.8/" "sbt-0.13.8.zip"
download "http://mirrors.ukfast.co.uk/sites/ftp.apache.org/maven/maven-3/3.3.9/binaries/" "apache-maven-3.3.9-bin.zip"
download "http://dl.fedoraproject.org/pub/epel/7/x86_64/e/" "epel-release-7-5.noarch.rpm"
download "http://7d9nal.com2.z0.glb.qiniucdn.com/" "gogs_v0.8.25_linux_386.zip"
download "http://pkg.jenkins-ci.org/redhat/" "jenkins-1.647-1.1.noarch.rpm"
download "https://bintray.com/artifact/download/groovy/maven/" "apache-groovy-binary-2.4.4.zip"
download "http://dl.fedoraproject.org/pub/epel/7/x86_64/n/" "nginx-1.6.3-8.el7.x86_64.rpm"
download "http://dl.fedoraproject.org/pub/epel/7/x86_64/n/" "nginx-filesystem-1.6.3-8.el7.noarch.rpm"
download "http://mirror.centos.org/centos/7/os/x86_64/Packages/" "perl-5.16.3-286.el7.x86_64.rpm"
download "http://opensource.wandisco.com/centos/7/git/x86_64/" "wandisco-git-release-7-1.noarch.rpm"
download "http://opensource.wandisco.com/centos/7/git/x86_64/" "git-2.4.1-1.WANdisco.259.x86_64.rpm"
download "http://opensource.wandisco.com/centos/7/git/x86_64/" "perl-Git-2.4.1-1.WANdisco.259.noarch.rpm"
download_as "http://sourceforge.net/projects/sonar-pkg/files/rpm/noarch/sonar-5.2-1.noarch.rpm/download" "sonar-5.2-1.noarch.rpm"
download_as "http://bit.ly/Hqvfi9" "artifactory.rpm"
download_mysql_connector $ROOT mysql-connector-java-5.1.36
download "http://repo1.maven.org/maven2/org/codehaus/sonar/runner/sonar-runner-dist/2.4/" "sonar-runner-dist-2.4.zip"
download "http://updates.jenkins-ci.org/latest/" "artifactory.hpi"
download "http://updates.jenkins-ci.org/latest/" "ansible.hpi"
download "http://updates.jenkins-ci.org/latest/" "credentials.hpi"
download "http://updates.jenkins-ci.org/latest/" "docker-build-step.hpi"
download "http://updates.jenkins-ci.org/latest/" "docker-commons.hpi"
download "http://updates.jenkins-ci.org/latest/" "email-ext.hpi"
download "http://updates.jenkins-ci.org/latest/" "envinject.hpi"
download "http://updates.jenkins-ci.org/latest/" "git.hpi"
download "http://updates.jenkins-ci.org/latest/" "git-client.hpi"
download "http://updates.jenkins-ci.org/latest/" "git-server.hpi"
download "http://updates.jenkins-ci.org/latest/" "gradle.hpi"
download "http://updates.jenkins-ci.org/latest/" "sbt.hpi"
download "http://updates.jenkins-ci.org/latest/" "sonar.hpi"
download "http://updates.jenkins-ci.org/latest/" "ssh-credentials.hpi"
download "http://updates.jenkins-ci.org/latest/" "ssh-slaves.hpi"
download "http://updates.jenkins-ci.org/latest/" "teamconcert.hpi"
download "http://updates.jenkins-ci.org/latest/" "workflow-aggregator.hpi"
download "http://updates.jenkins-ci.org/latest/" "workflow-job.hpi"
download "http://updates.jenkins-ci.org/latest/" "workflow-step-api.hpi"
download "http://updates.jenkins-ci.org/latest/" "workflow-cps.hpi"
download "http://updates.jenkins-ci.org/latest/" "workflow-support.hpi"
download "http://updates.jenkins-ci.org/latest/" "workflow-durable-task-step.hpi"
download "http://updates.jenkins-ci.org/latest/" "workflow-basic-steps.hpi"
download "http://updates.jenkins-ci.org/latest/" "workflow-scm-step.hpi"
download "http://updates.jenkins-ci.org/latest/" "workflow-api.hpi"
download "http://updates.jenkins-ci.org/latest/" "workflow-cps-global-lib.hpi"
download "http://updates.jenkins-ci.org/latest/" "ws-cleanup.hpi"

# nginx-filesystem = 1:1.6.3-7.el7
