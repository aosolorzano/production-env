#!/bin/bash

echo "Installing Vagrant..."
wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.rpm
sudo yum localinstall vagrant_1.8.1_x86_64.rpm
vagrant plugin install vagrant-cachier

echo "Adding Vagrant boxes:  Ubuntu Trusty 64 and CentOS 7..."
vagrant box add ubuntu/trusty64 --provider=virtualbox
