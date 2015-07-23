#!/usr/bin/env bash

# fetches all required packages and copies them to the ROOT folder

ROOT='files/'

# creates the root folder if it does not exist
if [[ ! -e $ROOT ]]; then
    mkdir $ROOT
fi

# removes rpms, zips and gz files from the root folder if 'clean' is passed as parameter to the shell script
if [[ $1 == "clean" ]]; then
    echo "Refreshing cache in progress...\n"
    rm $ROOT*.rpm
    rm $ROOT*.zip
    rm $ROOT*.gz
fi

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
    fi
}

# download from URI but assign different filename
download_() {
    if [[ ! -e $ROOT$2 ]]; then
        wget -O $ROOT$2 $1
    fi
}

# download the following files to the root folder if they do not exist
download "http://download.oracle.com/otn-pub/java/jdk/8u51-b16/" "jdk-8u51-linux-x64.rpm" "Cookie: oraclelicense=accept-securebackup-cookie"
download "https://services.gradle.org/distributions/" "gradle-2.5-bin.zip"
download "https://dl.bintray.com/sbt/native-packages/sbt/0.13.8/" "sbt-0.13.8.zip"
download "http://mirrors.muzzy.org.uk/apache/maven/maven-3/3.3.3/binaries/" "apache-maven-3.3.3-bin.zip"
download "http://download.jetbrains.com/idea/" "ideaIU-14.1.4.tar.gz"
download "https://dl.bintray.com/mitchellh/packer/" "packer_0.8.2_linux_amd64.zip"
download "http://downloads.typesafe.com/typesafe-activator/1.3.5/" "typesafe-activator-1.3.5.zip"
download "https://dl.google.com/linux/direct/" "google-chrome-stable_current_x86_64.rpm"
download "http://dl.fedoraproject.org/pub/epel/7/x86_64/e/" "epel-release-7-5.noarch.rpm"
download "http://dev.mysql.com/get/Downloads/MySQLGUITools/" "mysql-workbench-community-6.3.4-1.el7.x86_64.rpm"
download "http://robomongo.org/files/linux/" "robomongo-0.8.5-x86_64.rpm"
download "http://downloads.typesafe.com/scalaide-pack/4.1.0-vfinal-luna-211-20150704/" "scala-SDK-4.1.0-vfinal-2.11-linux.gtk.x86_64.tar.gz"
download "https://dl.bintray.com/mitchellh/vagrant/" "vagrant_1.7.3_x86_64.rpm"
download "http://gogs.dn.qbox.me/" "gogs_v0.6.1_linux_amd64.zip"
download "http://pkg.jenkins-ci.org/redhat/" "jenkins-1.620-1.1.noarch.rpm"
download "http://downloads.sonarsource.com/sonarqube/" "sonarqube-5.1.1.zip"
download_ "http://bit.ly/Hqvfi9" "artifactory.rpm"