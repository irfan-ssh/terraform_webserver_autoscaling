#!/bin/bash
apt-get update
apt-get install nginx -y
echo "welcome to DevOps" > /var/www/html/index.html