#!/usr/bin/env bash

# fetches all required packages and copies them to the ROOT folder

ROOT='files/cache/'

# creates the root folder if it does not exist
if [[ ! -e $ROOT ]]; then
    mkdir -p $ROOT
fi

# removes rpms, zips and gz files from the root folder if 'clean' is passed as parameter to the shell script
if [[ $1 == "clean" ]]; then
    echo "Refreshing cache in progress...\n"
    rm $ROOT*.rpm
    rm $ROOT*.zip
    rm $ROOT*.gz
    rm $ROOT*.jar
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
download "http://dl.fedoraproject.org/pub/epel/7/x86_64/e/" "epel-release-7-5.noarch.rpm"
download "http://mirror.centos.org/centos/7.1.1503/extras/x86_64/Packages/" "docker-1.7.1-108.el7.centos.x86_64.rpm"
download "http://mirror.centos.org/centos/7.1.1503/extras/x86_64/Packages/" "golang-1.4.2-1.el7.centos.x86_64.rpm"
download "http://mirror.centos.org/centos/7.1.1503/os/x86_64/Packages/" "httpd-tools-2.4.6-31.el7.centos.x86_64.rpm"
