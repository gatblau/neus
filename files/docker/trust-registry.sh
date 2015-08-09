#!/usr/bin/env bash
# configures the Docker daemon to trust the docker registry by deploying the registry certificate
# run this file on the registry client
DOMAIN=$1
PORT=$2

if [[ -z $DOMAIN ]]; then
   # sets default value
   DOMAIN="gatblau.org"
fi

if [[ -z $PORT ]]; then
   # sets default value
   PORT=5000
fi

mkdir -p /etc/docker/certs.d/$DOMAIN:$PORT/ca.crt
cp /tmp/$DOMAIN.crt /etc/docker/certs.d/$DOMAIN:$PORT/ca.crt

# see: https://github.com/docker/distribution/blob/master/docs/authentication.md
cp /tmp/$DOMAIN.crt /etc/pki/ca-trust/source/anchors/$DOMAIN.crt
update-ca-trust