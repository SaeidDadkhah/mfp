#!/bin/bash

echo Starting clone
apt-get install -y git nginx
git clone https://github.com/SaeidDadkhah/mfp.git
echo Clone finished

echo Starting to run main setup
mfp/setup.sh
echo Main setup finished
