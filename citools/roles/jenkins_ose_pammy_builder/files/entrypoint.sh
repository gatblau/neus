#!/usr/bin/env bash
java -jar /opt/swarm-client-jar-with-dependencies.jar -master http://${BUILD_SERVICE_HOST}:8080
