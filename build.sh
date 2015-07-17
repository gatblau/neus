#!/usr/bin/env bash
ROOT="$PWD"
cd pamm.dev
sh fetch.sh
cd vb/
packer build pamm-dev-centos71-vg-vb.json
cd $ROOT
echo done!