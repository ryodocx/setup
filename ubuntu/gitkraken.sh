#!/bin/bash -xe

URL="https://release.gitkraken.com/linux/gitkraken-amd64.deb"

curl -L $URL -o tmp
sudo dpkg -i tmp
rm tmp
sudo apt-get install -f -y