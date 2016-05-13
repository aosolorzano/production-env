#!/bin/bash
set -e
echo "Installing Open JDK 8 ..."
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
add-apt-repository -y ppa:webupd8team/java
apt-get update
apt-get install -y oracle-java8-installer
rm -rf /var/cache/oracle-jdk8-installer
export JAVA_HOME="/usr/lib/jvm/java-8-oracle"

echo "Installing Wildfly 10.0.0.Final ..."
export WILDFLY_VERSION="10.0.0.Final"
export JBOSS_HOME="/opt/jboss/wildfly"
curl https://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz | tar -xz
mkdir /opt/jboss/
mv wildfly-$WILDFLY_VERSION $JBOSS_HOME
$JBOSS_HOME/bin/add-user.sh admin Admin123 --silent
