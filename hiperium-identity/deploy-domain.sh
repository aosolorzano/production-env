#!/bin/bash
set -e
echo "Create virtual machines with Vagrant"
vagrant up --provision --no-parallel
echo "Install dependencies using Ansible on domain nodes"
vagrant ssh identity-balancer -c 'ansible-playbook /vagrant/ansible/nodes.yml -i /vagrant/ansible/hosts/nodes'
echo "Build and run Docker images on domain nodes"
vagrant ssh identity-node1 -c 'cd /vagrant/docker-nodes; docker build --tag=jboss/wildfly-admin .; docker run -d -p 8080:8080 -p 9990:9990 jboss/wildfly /opt/jboss/wildfly/bin/standalone.sh -c standalone-ha.xml -b 0.0.0.0 -bmanagement 0.0.0.0 -Djboss.node.name=identity-node1'
vagrant ssh identity-node2 -c 'cd /vagrant/docker-nodes; docker build --tag=jboss/wildfly-admin .; docker run -d -p 8080:8080 -p 9990:9990 jboss/wildfly /opt/jboss/wildfly/bin/standalone.sh -c standalone-ha.xml -b 0.0.0.0 -bmanagement 0.0.0.0 -Djboss.node.name=identity-node2'
