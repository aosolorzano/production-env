#!/bin/bash
# Install all needed dependencies to setup all environment
set -e
echo "Installing Vagrant and plugins..."
wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.rpm
sudo yum localinstall vagrant_1.8.1_x86_64.rpm
vagrant plugin install vagrant-vbguest vagrant-cachier

echo "Add Vagrant box - Ubuntu Trusty 64"
vagrant box add trusty64 ubuntu/trusty64 --provider=virtualbox
