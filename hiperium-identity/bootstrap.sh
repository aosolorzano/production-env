#!/bin/bash
echo "Installing Ansible..."
sudo apt-get install -y software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible
sudo cp /vagrant/ansible/ansible.cfg /etc/ansible/ansible.cfg
