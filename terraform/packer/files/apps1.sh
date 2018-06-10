#!/bin/bash -e
echo "starting ansible installation"
sleep 10
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get -y update
sudo apt-get -y install ansible
sleep 10
echo "ansible installed successfully"
sleep 10
echo "installing additional apps"
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y wget
sudo apt-get install -y git 
sudo apt-get install -y curl 
sudo apt-get install -y zip
sudo apt-get install -y unzip 
sudo apt-get install -y python 
sudo apt-get install -y docker.io
sudo apt-get install -y awscli 
sudo update-ca-certificates -f 
sleep 10
echo "installed additional apps"
sleep 10
# install terraform
echo "installing terraform"
sudo wget https://releases.hashicorp.com/terraform/0.9.8/terraform_0.9.8_linux_amd64.zip
sudo unzip terraform_0.9.8_linux_amd64.zip
sudo mv terraform /usr/local/bin/
rm terraform_0.9.8_linux_amd64.zip
sleep 10