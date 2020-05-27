#!/bin/bash

set -e

if [[ "ls -a  /etc/debian_version" ]]
  then
    if [[ "ls -a /etc | grep python2" || "ls -a /etc | grep python3" ]]
      then
        echo "Python Ok"
      else
        apt-get update
        apt-get install python -y
    fi
    if [[ "ls -a /etc | grep ansible" ]]
      then
        echo "Ansible Ok"
      else
        apt update
        # apt install software-properties-common
        # apt-add-repository --yes --update ppa:ansible/ansible
        apt install ansible -y
    fi
  else
    echo "This example works for OS Debian family!"
    exit 1
fi