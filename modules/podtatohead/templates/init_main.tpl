#!/bin/bash
sudo yum update -y
wget https://github.com/aquasecurity/trivy/releases/download/v0.19.2/trivy_0.19.2_Linux-64bit.rpm
sudo yum localinstall /trivy_0.19.2_Linux-64bit.rpm -y
sudo amazon-linux-extras install epel -y
sudo yum-config-manager --enable epel
sudo yum install certbot -y
export PUBLIC_IPV4_ADDRESS="$(curl http://169.254.169.254/latest/meta-data/public-ipv4)"
export PUBLIC_INSTANCE_NAME="$(curl http://169.254.169.254/latest/meta-data/public-hostname)"
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo docker run -p 8080:8080 -e PORT=8080 -e HATS_HOST=${hats_host} -e HATS_PORT=8080 -e ARMS_HOST=${arms_host} -e ARMS_PORT=8080 -e LEGS_HOST=${legs_host} -e LEGS_PORT=8080 -d ${container_image}:${podtato_version}