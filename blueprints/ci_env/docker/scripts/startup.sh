#!/usr/bin/env bash

# Initialisation script for CI Bronze Docker container

# Start MySQL
/usr/bin/mysqld_safe &

# Start nginx
/sbin/nginx &

# Start Artifactory
/var/opt/jfrog/artifactory/misc/service/artifactory start &

# Start Jenkins
su -c "java -jar /usr/lib/jenkins/jenkins.war --prefix=/jenkins &" - jenkins

# Start Sonar
su -c "/opt/sonar/bin/linux-x86-64/sonar.sh start &" - sonar

# Start GOGS
while true
do
  su -c "/usr/local/gogs/gogs web &" - gogs
  while pgrep "gogs" > /dev/null 2>&1
  do
    sleep 1
  done
done

# Stop container exiting
wait
