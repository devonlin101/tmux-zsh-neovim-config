#!/bin/bash

sudo apt-get update -y;
sudo apt-get upgrade -y;
sudo apt-get dist-upgrade -y;
sudo ubuntu-drivers autoinstall;
npm outdated -g; 
npm update -g;
sudo apt-get clean -y;
sudo apt-get autoclean -y;
sudo apt-get autoremove -y;
snap list --all;
ip a
ip r
resolvectl status | grep Current
df -h;
free -m;
duf;
neofetch
date

