#!/bin/bash

set -e

OS1=$(awk '/DISTRIB_ID=/' /etc/*-release | sed 's/DISTRIB_ID=//' | tr '[:upper:]' '[:lower:]')

if [[ "$OS1" == "ubuntu" || "$OS1" == "debian" ]]
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
elif [[ "ls -a /etc | grep centos" || "ls -a /etc | grep redhat" ]]
  then
    if [[ "ls -a /etc | grep python2" || "ls -a /etc | grep python3"  ]]
      then
        echo "Python Ok"
      else
        yum install epel-release -y
        yum update -y
        yum install python -y
    fi
    if [[ "ls -a /etc | grep ansible"  ]]
      then
        echo "Ansible Ok"
      else
        yum update -y
        yum install ansible -y
    fi
fi
