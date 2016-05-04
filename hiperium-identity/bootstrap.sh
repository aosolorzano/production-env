#!/bin/bash
set -e
echo "Installing Ansible..."
apt-get install -y software-properties-common
apt-add-repository ppa:ansible/ansible
apt-get update
apt-get install -y ansible
cp /vagrant/ansible/ansible.cfg /etc/ansible/ansible.cfg
echo "Installing Apache Web Server..."
sudo apt-get install -y apache2
