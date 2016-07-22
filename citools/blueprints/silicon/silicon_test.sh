#!/usr/bin/env bash
# This script runs the CI Tools Docker images for local testing
export VERSION=latest
docker run -d -u 10000 --name mariadb -p 3306:3306 silicon/ci-mariadb:$VERSION
docker run -d -u 10000 --name nexus -p 8081:8081 silicon/ci-nexus:$VERSION
docker run -d -u 10000 --name gogs -p 3000:3000 -e DB_IP_ADDRESS=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' mariadb) silicon/ci-gogs:$VERSION
docker run -d -u 10000 --name sonar -p 9000:9000 -e DB_IP_ADDRESS=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' mariadb) silicon/ci-sonar:$VERSION
docker run -d -u 10000 --name jenkins -p 8080:8080 -e NEXUS_IP_ADDRESS=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' nexus) -e GOGS_IP_ADDRESS=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' gogs) -e SONAR_IP_ADDRESS=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' sonar) silicon/ci-jenkins:$VERSION

echo MariaDB container IP address: docker inspect --format '{{ .NetworkSettings.IPAddress }}' mariadb
echo Nexus   container IP address: docker inspect --format '{{ .NetworkSettings.IPAddress }}' nexus
echo GOGS    container IP address: docker inspect --format '{{ .NetworkSettings.IPAddress }}' gogs
echo Sonar   container IP address: docker inspect --format '{{ .NetworkSettings.IPAddress }}' sonar
echo Jenkins container IP address: docker inspect --format '{{ .NetworkSettings.IPAddress }}' jenkins
