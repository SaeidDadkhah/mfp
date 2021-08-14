#!/bin/bash

echo Starting installing packages
export LC_ALL=C
apt-get install -y nginx python3 python3-pip libsodium-dev htop
echo Installing packages finished

echo Starting installing shadowsocks
pip install shadowsocks
pip install https://github.com/shadowsocks/shadowsocks/archive/master.zip -U
ssserver -p 31066 -k "2wsxWSX2WSXwsx" -m "chacha20-ietf-poly1305" -d start
echo Installing shadowsocks finished

echo Starting daemonizing shadowsocks
cp myscript.sh /etc/init.d/
chmod ugo+x /etc/init.d/myscript.sh
update-rc.d myscript.sh defaults
echo Daemonizing shadowsocks finished

echo Starting copy site files
wget http://us.download.nvidia.com/Windows/436.30/436.30-notebook-win10-64bit-international-dch-whql.exe
mv 436.30-notebook-win10-64bit-international-dch-whql.exe pages/
cp pages/* /var/www/
echo Copy site files finished

echo Starting configuring nginx
rm /etc/nginx/sites-available/default
cp nginx.conf /etc/nginx/nginx.conf
service nginx restart
echo Configuring nginx finished
