#!/usr/bin/env bash

# fetches all required packages and copies them to the ROOT folder

ROOT='../../files/cache/'

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
    rm $ROOT*.hpi
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

# download and unzips the mysql connector jar
download_mysql_connector() {
    CONNECTOR_FILE=mysql-connector-java-5.1.36.tar.gz
    if [[ ! -e $ROOT$CONNECTOR_FILE ]]; then
        wget -O $ROOT$CONNECTOR_FILE "http://dev.mysql.com/get/Downloads/Connector-J/$CONNECTOR_FILE"
        tar -zxf $ROOT$CONNECTOR_FILE -C $ROOT *.jar
        mv $ROOT'mysql-connector-java-5.1.36/mysql-connector-java-5.1.36-bin.jar' $ROOT
        rm -r $ROOT'mysql-connector-java-5.1.36'
    fi
}

# download the following files to the root folder if they do not exist
download "http://download.oracle.com/otn-pub/java/jdk/8u66-b17/" "jdk-8u66-linux-x64.rpm" "Cookie: oraclelicense=accept-securebackup-cookie"
download "https://services.gradle.org/distributions/" "gradle-2.7-bin.zip"
download "https://dl.bintray.com/sbt/native-packages/sbt/0.13.8/" "sbt-0.13.8.zip"
download "http://mirrors.muzzy.org.uk/apache/maven/maven-3/3.3.3/binaries/" "apache-maven-3.3.3-bin.zip"
download "http://dl.fedoraproject.org/pub/epel/7/x86_64/e/" "epel-release-7-5.noarch.rpm"
download "http://robomongo.org/files/linux/" "robomongo-0.8.5-x86_64.rpm"
download "http://gogs.dn.qbox.me/" "gogs_v0.7.22_linux_amd64.zip"
download "http://pkg.jenkins-ci.org/redhat/" "jenkins-1.639-1.1.noarch.rpm"
download "https://bintray.com/artifact/download/groovy/maven/" "apache-groovy-binary-2.4.4.zip"
download "http://dl.fedoraproject.org/pub/epel/7/x86_64/n/" "nginx-1.6.3-7.el7.x86_64.rpm"
download "http://mirror.centos.org/centos/7.1.1503/os/x86_64/Packages/" "perl-5.16.3-285.el7.x86_64.rpm"
download "http://opensource.wandisco.com/centos/7/git/x86_64/" "wandisco-git-release-7-1.noarch.rpm"
download "http://opensource.wandisco.com/centos/7/git/x86_64/" "git-2.4.1-1.WANdisco.259.x86_64.rpm"
download "http://opensource.wandisco.com/centos/7/git/x86_64/" "perl-Git-2.4.1-1.WANdisco.259.noarch.rpm"
download_ "http://sourceforge.net/projects/sonar-pkg/files/rpm/noarch/sonar-5.2-1.noarch.rpm/download" "sonar-5.2-1.noarch.rpm"
download_ "http://bit.ly/Hqvfi9" "artifactory.rpm"
download_mysql_connector
download "http://repo1.maven.org/maven2/org/codehaus/sonar/runner/sonar-runner-dist/2.4/" "sonar-runner-dist-2.4.zip"
download "http://updates.jenkins-ci.org/latest/" "artifactory.hpi"
download "http://updates.jenkins-ci.org/latest/" "ansible.hpi"
download "http://updates.jenkins-ci.org/latest/" "credentials.hpi"
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
