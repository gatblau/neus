#!/usr/bin/env bash

# fetches all required packages and copies them to
# the relevant 'adam/roles/role/files' folders

ROOT='files/'

JDK_TARGET=$ROOT'jdk-8u45-linux-x64.rpm'
JDK_URI='http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.rpm'

if [[ ! -e $JDK_TARGET ]]; then
    echo Downloading the JDK $JDK_TARGET...
    curl -L --header 'Cookie: oraclelicense=accept-securebackup-cookie' $JDK_URI -o $JDK_TARGET
fi
