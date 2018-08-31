#!/bin/bash
# adct - Docker Installation
# https://github.com/ArtiomL/f5-terraform
# Artiom Lichtenstein
# v1.0.0, 31/08/2018

# Core dependencies
sudo apt-get update
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER
newgrp docker

# adct
docker run -dit -p 80:8080 -p 443:8443 artioml/adct
docker run -dit -p 4433:4433 artioml/adct:ws
