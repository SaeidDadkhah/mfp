#!/bin/bash

echo Starting clone
cd ~
apt-get install -y git
git clone https://github.com/SaeidDadkhah/mfp.git
echo Clone finished

echo Starting copy site files
cp pages/* /var/www/
echo Copy site files finished

echo Starting to run main setup
cd mfp
chmod +x setup.sh
setup.sh
echo Main setup finished
