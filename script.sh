#!/bin/bash

apt-get update -y && sudo apt-get upgrade
apt-get install curl -y
### nodejs 15 install
apt-get install curl -y
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt-get install build-essential nodejs 
mkdir myapp
cd myapp
npm init
npm install express --save
npm install -g express-generator
### python
apt install python3-venv
mkdir cloudwaferlabs_flask_app
cd cloudwaferlabs_flask_app
python3 -m venv venv
source venv/bin/activate
pip install flask
#### postresql
apt install postgresql-client-9.6 postgresql-9.6 -y

