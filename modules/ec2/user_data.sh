#!/bin/bash
apt update -y
apt install -y docker.io
systemctl start docker
systemctl enable docker

docker pull strapi/strapi

docker run -d \
  --name strapi \
  -p 1337:1337 \
  -e NODE_ENV=development \
  --restart always \
  strapi/strapi
