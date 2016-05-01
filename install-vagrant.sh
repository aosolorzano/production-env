#!/bin/bash
# Install all needed dependencies to setup all environment

echo "Installing Vagrant and plugins..."
wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.rpm
yum localinstall vagrant_1.8.1_x86_64.rpm
vagrant plugin install vagrant-cachier
echo "Add Vagrant box - Hashicorp Precise"
vagrant box add precise64 http://files.vagrantup.com/precise64.box
