#!/bin/bash

echo Starting installing packages
apt-get install -y nginx
echo Installing packages finished

echo Starting configuring nginx
rm /etc/nginx/sites-available/default
mv nginx.conf /etc/nginx/nginx.conf
service nginx restart
echo Configuring nginx finished
