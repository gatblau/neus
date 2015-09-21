#!/usr/bin/env bash
# configures the Docker daemon to trust the docker registry by deploying the registry certificate
# run this file on the registry client
DOMAIN=$1

if [[ -z $DOMAIN ]]; then
   # sets default value
   DOMAIN="registry"
fi

cp /tmp/$DOMAIN.crt /etc/pki/ca-trust/source/anchors/$DOMAIN.crt
update-ca-trust