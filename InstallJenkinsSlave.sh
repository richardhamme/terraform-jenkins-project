#!/bin/bash
echo "Install Docker"
sudo su -
yum update -y
yum install docker -y
usermod -aG docker ec2-user
service docker start

#Install the listener (used by the Jenkins master to initiate job)
sudo docker run -p 3375:2375 -v /var/run/docker.sock:/var/run/docker.sock -d shipyard/docker-proxy