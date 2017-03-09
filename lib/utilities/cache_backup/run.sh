#!/usr/bin/env bash

ansible-playbook -i inventory site.yml --tags=$1
