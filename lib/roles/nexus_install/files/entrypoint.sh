#!/usr/bin/env bash
# Start Nexus console
export NEXUS_HOME=/usr/local/nexus/default
export JAVA_HOME=/usr/java/latest/

# Start Nexus OSS
echo nexus | su - nexus -c "/usr/local/nexus/default/bin/nexus console"
