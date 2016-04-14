#!/usr/bin/env bash
# Start Jenkins
su -c "java -jar /usr/lib/jenkins/jenkins.war &" - jenkins
wait
