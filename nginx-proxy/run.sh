#!/usr/bin/env bash

NGINX_DIR=$(pwd)

docker run -itd --name reverse-proxy \
 -p 80:80 -p 443:443 --ip 10.0.0.100 \
 --net dockerconfig_intra --hostname reverse \
 -v ${NGINX_DIR}/etc:/etc/nginx \
 -v ${NGINX_DIR}/log:/var/log/nginx \
 -v ${NGINX_DIR}/www:/var/www \
 nginx:latest
