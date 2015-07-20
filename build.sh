#!/usr/bin/env bash
ROOT="$PWD"
cd pamm
sh fetch.sh
cd vbox/
packer build pamm-dev-gui-vbox.json
cd $ROOT
echo done!