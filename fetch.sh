#!/usr/bin/env bash

# fetches all required packages and copies them to
# the ROOT folder

ROOT='files/'
USER_AGENT="-H 'User-Agent: Mozilla/5.0"

download() {
    if [[ ! -e $1 ]]; then
        echo Downloading $1 ...
        curl -A "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.112 Safari/534.30" -L $2 -o $1
    fi
}

if [[ ! -e $ROOT ]]; then
    mkdir $ROOT
fi

MAVEN_FILE='apache-maven-3.3.3-bin.zip'
MAVEN_URI="http://mirrors.muzzy.org.uk/apache/maven/maven-3/3.3.3/binaries/$MAVEN_FILE"

GRADLE_FILE='gradle-2.5-bin.zip'
GRADLE_URI='https://services.gradle.org/distributions/$GRADLE_FILE'

SBT_FILE='sbt-0.13.8.zip'
SBT_URI='https://dl.bintray.com/sbt/native-packages/sbt/0.13.8/$SBT_FILE'

INTELLIJ_FILE='ideaIU-14.1.4.tar.gz'
INTELLIJ_URI='http://download.jetbrains.com/idea/$INTELLIJ_FILE'

VAGRANT_FILE='vagrant_1.7.3_x86_64.rpm'
VAGRANT_URI='https://dl.bintray.com/mitchellh/vagrant/#$VAGRANT_FILE'

PACKER_FILE='packer_0.8.2_linux_amd64.zip'
PACKER_URI='https://dl.bintray.com/mitchellh/packer/$PACKER_FILE'

ACTIVATOR_FILE='typesafe-activator-1.3.5.zip'
ACTIVATOR_URI='http://downloads.typesafe.com/typesafe-activator/1.3.5/typesafe-activator-1.3.5.zip?_ga=1.118624000.824516920.1437227583'

download $ROOT$GRADLE_FILE $GRADLE_URI
download $ROOT$SBT_FILE $SBT_URI
download $ROOT$VAGRANT_FILE $VAGRANT_URI
download $ROOT$MAVEN_FILE $MAVEN_URI
download $ROOT$ACTIVATOR_FILE $ACTIVATOR_URI
download $ROOT$MY_SQL_WB_FILE $MY_SQL_WB_URI

echo "Download the Java JDK manually from 'http://download.oracle.com/otn-pub/java/jdk/8u51-b16/jdk-8u51-linux-x64.rpm'"
echo "Download PACKER manually from 'https://dl.bintray.com/mitchellh/packer/packer_0.8.2_linux_amd64.zip'"
echo "Download INTELLIJ manually from 'http://download.jetbrains.com/idea/ideaIU-14.1.4.tar.gz'"
echo "Download MY SQL WORKBENCH manually from 'http://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community-6.3.4-1.el7.x86_64.rpm'"
echo "Download RoboMongo manually from 'http://robomongo.org/files/linux/robomongo-0.8.5-x86_64.rpm'"
echo "Download SCALA IDE manually from 'http://downloads.typesafe.com/scalaide-pack/4.1.0-vfinal-luna-211-20150704/scala-SDK-4.1.0-vfinal-2.11-linux.gtk.x86_64.tar.gz'"
echo "Place all downloaded items in the '$ROOT' folder"