#!/bin/bash
set -e
echo "Installing Open JDK 8 ..."
sudo echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java8-installer
sudo rm -rf /var/cache/oracle-jdk8-installer
export JAVA_HOME="/usr/lib/jvm/java-8-oracle"

echo "Installing and starting Wildfly App Server 10.0.0.Final ..."
export WILDFLY_VERSION="10.0.0.Final"
curl https://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz | tar -xz
sudo mkdir /opt/jboss/
export JBOSS_HOME="/opt/jboss/wildfly"
sudo mv wildfly-$WILDFLY_VERSION $JBOSS_HOME
sudo chown -R vagrant:vagrant $JBOSS_HOME
$JBOSS_HOME/bin/add-user.sh admin Admin123 --silent
IP_ADDR=$(ip addr show eth1 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
sed -i "s|jboss.bind.address.management:127.0.0.1|jboss.bind.address.management:$IP_ADDR|g" $JBOSS_HOME/standalone/configuration/standalone-ha.xml
sed -i "s|jboss.bind.address:127.0.0.1|jboss.bind.address:$IP_ADDR|g" $JBOSS_HOME/standalone/configuration/standalone-ha.xml
sed -i "s|jboss.bind.address.private:127.0.0.1|jboss.bind.address.private:$IP_ADDR|g" $JBOSS_HOME/standalone/configuration/standalone-ha.xml

echo "Deploying Hiperium Identity Service ..."
curl -u admin:admin123 -L "http://repository-hiperium.rhcloud.com/service/local/artifact/maven/content?g=com.hiperium&a=hiperium-identity&v=LATEST&p=war&r=snapshots" -o $JBOSS_HOME/standalone/deployments/hiperium-identity.war
