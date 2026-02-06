#!/bin/bash

apt update -y
apt install -y docker.io git

systemctl start docker
systemctl enable docker

cd /home/ubuntu

# If folder already exists, remove it
if [ -d "strapi-local-setup" ]; then
  rm -rf strapi-local-setup
fi

git clone https://github.com/namitagrawal2001/strapi-local-setup.git
cd strapi-local-setup

docker build -t strapi-app .

docker run -d \
  --name strapi \
  -p 80:1337 \
  -e HOST=0.0.0.0 \
  -e PORT=1337 \
  -e APP_KEYS="key1,key2,key3,key4" \
  -e API_TOKEN_SALT="randomSalt123" \
  -e ADMIN_JWT_SECRET="adminSecret123" \
  -e JWT_SECRET="jwtSecret123" \
  --restart always \
  strapi-app
