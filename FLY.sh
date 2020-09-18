#!/bin/bash

yum install -y yum-utils

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum install docker-ce docker-ce-cli containerd.io -y

systemctl start docker

systemctl enable docker

docker build -t ALFRED .

docker run -d -p 3307:3307 -e MYSQL_ROOT_PASSWORD=secret --restart always --name ALFRED -v /var/lib/mysql:/var/lib/mysql -v $(pwd)/BATCAVE:/BATCAVE ALFRED
