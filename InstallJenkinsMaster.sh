#!/bin/bash
echo "Install Jenkins"
sudo su -
yum update
yum remove -y java
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade -y
sudo yum install -y jenkins java-1.8.0-openjdk-devel
chkconfig jenkins on

echo "Get Jenkins Config Files"
curl https://raw.githubusercontent.com/richardhamme/jenkinsmaster/master/basic-security.groovy -o /tmp/basic-security.groovy
curl https://raw.githubusercontent.com/richardhamme/jenkinsmaster/master/disable-cli.groovy -o /tmp/disable-cli.groovy
curl https://raw.githubusercontent.com/richardhamme/jenkinsmaster/master/csrf-protection.groovy -o /tmp/csrf-protection.groovy
curl https://raw.githubusercontent.com/richardhamme/jenkinsmaster/master/disable-jnlp.groovy -o /tmp/disable-jnlp.groovy
curl https://raw.githubusercontent.com/richardhamme/jenkinsmaster/master/node-agent.groovy -o /tmp/node-agent.groovy
curl https://raw.githubusercontent.com/richardhamme/jenkinsmaster/master/jenkins -o /tmp/jenkins
curl https://raw.githubusercontent.com/richardhamme/jenkinsmaster/master/install-plugins.sh -o /tmp/install-plugins.sh
curl https://raw.githubusercontent.com/richardhamme/jenkinsmaster/master/plugins.txt -o /tmp/plugins.txt
curl https://raw.githubusercontent.com/richardhamme/jenkinsmaster/master/docker.groovy -o /tmp/docker.groovy

echo "Configure Jenkins"
mkdir -p /var/lib/jenkins/init.groovy.d
mv /tmp/basic-security.groovy /var/lib/jenkins/init.groovy.d/basic-security.groovy
mv /tmp/disable-cli.groovy /var/lib/jenkins/init.groovy.d/disable-cli.groovy
mv /tmp/csrf-protection.groovy /var/lib/jenkins/init.groovy.d/csrf-protection.groovy
mv /tmp/disable-jnlp.groovy /var/lib/jenkins/init.groovy.d/disable-jnlp.groovy
mv /tmp/node-agent.groovy /var/lib/jenkins/init.groovy.d/node-agent.groovy
mv /tmp/docker.groovy /var/lib/jenkins/init.groovy.d/docker.groovy
mv /tmp/jenkins /etc/sysconfig/jenkins
chmod +x /tmp/install-plugins.sh
bash /tmp/install-plugins.sh
service jenkins start

