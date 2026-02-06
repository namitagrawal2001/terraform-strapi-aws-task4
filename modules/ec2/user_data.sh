#!/bin/bash

apt update -y
apt install -y docker.io git

systemctl start docker
systemctl enable docker

cd /home/ubuntu
git clone https://github.com/namitagrawal2001/strapi-local-setup.git
cd strapi-local-setup

docker build -t strapi-app .
docker run -d -p 80:1337 --name strapi strapi-app
