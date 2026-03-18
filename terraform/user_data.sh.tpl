#!/bin/bash
yum update -y
amazon-linux-extras install docker -y
systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user

sleep 10

docker pull ${docker_image}
docker stop flask-app || true
docker rm flask-app || true
docker run -d --name flask-app -p 80:5000 ${docker_image}