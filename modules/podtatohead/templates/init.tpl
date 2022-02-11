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
sudo docker run -p 8080:8080 -e PORT=8080 -e LEFT_VERSION=${left_version} -e RIGHT_VERSION=${right_version} -d ${container_image}:${podtato_version}
