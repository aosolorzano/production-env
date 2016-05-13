#!/bin/bash
vagrant destroy -f
vagrant up --no-parallel
#vagrant ssh identity-balancer -c 'ansible-playbook /vagrant/ansible/nodes.yml -i /vagrant/ansible/hosts/nodes'
vagrant ssh identity-node1 -c '$JBOSS_HOME/bin/standalone.sh -c standalone-ha.xml -b 172.16.76.3 -bmanagement=172.16.76.3 -Djboss.node.name=identity-node1'
vagrant ssh identity-node1 -c '$JBOSS_HOME/bin/standalone.sh -c standalone-ha.xml -b 172.16.76.4 -bmanagement=172.16.76.4 -Djboss.node.name=identity-node2'
#vagrant ssh identity-node1 -c 'cd /vagrant/docker-nodes-image/; docker build --tag=jboss/wildfly-admin .; docker run -d -p 8080:8080 -p 9990:9990 jboss/wildfly /opt/jboss/wildfly/bin/standalone.sh -c standalone-ha.xml -b 0.0.0.0 -bmanagement 0.0.0.0 -Djboss.node.name=identity-node1'
#vagrant ssh identity-node2 -c 'cd /vagrant/docker-nodes-image/; docker build --tag=jboss/wildfly-admin .; docker run -d -p 8080:8080 -p 9990:9990 jboss/wildfly /opt/jboss/wildfly/bin/standalone.sh -c standalone-ha.xml -b 0.0.0.0 -bmanagement 0.0.0.0 -Djboss.node.name=identity-node2'
