#!/usr/bin/env bash
# This script runs the CI Tools silicon blueprint Docker images for local testing
export VERSION=latest

docker run -d -u 10000 --name si-mariadb -p 3306:3306 -h ci-mariadb silicon/test/ci-mariadb:$VERSION
export DB_IP_ADDRESS=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' si-mariadb)

docker run -d -u 10000 --name si-nexus -p 8081:8081 -h ci-nexus silicon/test/ci-nexus:$VERSION
export NEXUS_IP_ADDRESS=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' si-nexus)

docker run -d -u 10000 --name si-gogs -p 3000:3000 -h ci-gogs -e DB_IP_ADDRESS=$DB_IP_ADDRESS silicon/test/ci-gogs:$VERSION
export GOGS_IP_ADDRESS=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' si-gogs)

docker run -d -u 10000 --name si-sonar -p 9000:9000 -h ci-sonar -e DB_IP_ADDRESS=$DB_IP_ADDRESS silicon/test/ci-sonar:$VERSION
export SONAR_IP_ADDRESS=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' si-sonar)

docker run -d -u 10000 --name si-jenkins -p 8080:8080 -h ci-jenkins -e NEXUS_IP_ADDRESS=$NEXUS_IP_ADDRESS -e GOGS_IP_ADDRESS=$GOGS_IP_ADDRESS -e SONAR_IP_ADDRESS=$SONAR_IP_ADDRESS silicon/test/ci-jenkins:$VERSION
export JENKINS_IP_ADDRESS=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' si-jenkins)

docker run -d -u 10000 --name si-builder -h ci-builder -e JENKINS_URL=$JENKINS_IP_ADDRESS silicon/test/ci-pamm-builder:$VERSION

echo MariaDB container IP address: $DB_IP_ADDRESS
echo Nexus   container IP address: $NEXUS_IP_ADDRESS
echo GOGS    container IP address: $GOGS_IP_ADDRESS
echo Sonar   container IP address: $SONAR_IP_ADDRESS
echo Jenkins container IP address: $JENKINS_IP_ADDRESS
echo Build   container IP address: $(docker inspect --format '{{ .NetworkSettings.IPAddress }}' si-builder)
