#!/bin/bash

apt-get update -y
apt-get install -y
apt-get -y upgrade
apt-get install software-properties-common -y
apt-add-repository ppa:ansible/ansible -y
apt-get update
apt-get install -y ansible
apt-get -y install wget unzip zip sudo awscli docker.io

# install terraform
echo "installing terraform"
wget https://releases.hashicorp.com/terraform/0.9.8/terraform_0.9.8_linux_amd64.zip
unzip terraform_0.9.8_linux_amd64.zip
mv terraform /usr/local/bin/
sleep 10

