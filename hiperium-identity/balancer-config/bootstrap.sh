#!/bin/bash
set -e
echo "Installing Apache Web Server with mod_cluster ..."
apt-get update
apt-get install -y apache2
cp /vagrant/balancer-config/mod_cluster-1.3.1.Final/*.so /usr/lib/apache2/modules/
cp /vagrant/balancer-config/mod_cluster.load /vagrant/balancer-config/mod_cluster.conf /etc/apache2/mods-available/
ln -s /etc/apache2/mods-available/mod_cluster.load /etc/apache2/mods-enabled/
ln -s /etc/apache2/mods-available/mod_cluster.conf /etc/apache2/mods-enabled/
a2enmod proxy
a2enmod proxy_http
a2enmod proxy_ajp
service apache2 restart

#echo "Installing Ansible..."
#apt-get install -y software-properties-common
#apt-add-repository ppa:ansible/ansible
#apt-get install -y ansible
#cp /vagrant/ansible/ansible.cfg /etc/ansible/ansible.cfg
