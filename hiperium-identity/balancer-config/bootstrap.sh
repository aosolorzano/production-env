#!/bin/bash
set -e
echo "Installing and configuring Apache Web Server with mod_cluster ..."
apt-get update
apt-get install -y apache2
cp /vagrant/balancer-config/mod_cluster-1.3.1.Final/*.so /usr/lib/apache2/modules/
cp /vagrant/balancer-config/mod_cluster.load /vagrant/balancer-config/mod_cluster.conf /etc/apache2/mods-available/
a2enmod proxy
a2enmod proxy_http
a2enmod proxy_ajp
a2enmod mod_cluster
cp /vagrant/balancer-config/modcluster-site.conf /etc/apache2/sites-available/
a2ensite modcluster-site.conf
a2dissite 000-default.conf
echo "ServerName 172.16.76.130" >> /etc/apache2/apache2.conf
service apache2 restart
