#!/usr/bin/env bash
# This script runs the CI Tools Docker images for local testing
export VERSION=latest
docker run -d -u 10000 --name si-mariadb -p 3306:3306 silicon/ci-mariadb:$VERSION
docker run -d -u 10000 --name si-nexus -p 8081:8081 silicon/ci-nexus:$VERSION
docker run -d -u 10000 --name si-gogs -p 3000:3000 -e DB_IP_ADDRESS=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' si-mariadb) silicon/ci-gogs:$VERSION
docker run -d -u 10000 --name si-sonar -p 9000:9000 -e DB_IP_ADDRESS=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' si-mariadb) silicon/ci-sonar:$VERSION
docker run -d -u 10000 --name si-jenkins -p 8080:8080 -e NEXUS_IP_ADDRESS=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' si-nexus) -e GOGS_IP_ADDRESS=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' si-gogs) -e SONAR_IP_ADDRESS=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' si-sonar) silicon/ci-jenkins:$VERSION

echo MariaDB container IP address: $(docker inspect --format '{{ .NetworkSettings.IPAddress }}' si-mariadb)
echo Nexus   container IP address: $(docker inspect --format '{{ .NetworkSettings.IPAddress }}' si-nexus)
echo GOGS    container IP address: $(docker inspect --format '{{ .NetworkSettings.IPAddress }}' si-gogs)
echo Sonar   container IP address: $(docker inspect --format '{{ .NetworkSettings.IPAddress }}' si-sonar)
echo Jenkins container IP address: $(docker inspect --format '{{ .NetworkSettings.IPAddress }}' si-jenkins)
