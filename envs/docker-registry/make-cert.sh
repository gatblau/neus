#!/usr/bin/env bash
# creates self-signed TLS certificates for the registry

# pass the certificate domain as script parameter
DOMAIN=$1

# pass the certificate data as second parameter
DATA=$2

checkcmds() {
   cmds=("${!1}")
   for i in ${cmds[@]}
   do
      command -v ${i} >/dev/null 2>&1 || { echo >&2 "The '${i}' command is required but it's not installed. Aborting."; exit 1; }
   done
}

# checks if required commands are installed
commands=(openssl); checkcmds commands[@];

if [[ -z $DOMAIN ]]; then
   # sets default value
   DOMAIN="gatblau.org"
fi

if [[ -z $DATA ]]; then
   # sets default value
   DATA="/C=GB/CN=$DOMAIN"
fi

mkdir -p certs && openssl req -newkey rsa:4096 -nodes -sha256 -keyout certs/$DOMAIN.key -x509 -days 3650 -out certs/$DOMAIN.crt -subj $DATA
rm -rf ../../plays/files/docker/certs
mv certs ../../plays/files/docker