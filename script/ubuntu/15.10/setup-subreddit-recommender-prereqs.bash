#!/bin/bash

sudo apt-get --yes install synaptic git-daemon-sysvinit gitg
sudo apt-get --yes --install-suggests install nodejs
sudo apt-get --yes --install-suggests install nodejs-legacy
sudo apt-get --yes --install-suggests install npm ruby
sudo apt-get --yes --install-suggests install rails git git-hub libgsl0-dev libgsl0-dbg libpq-dev ruby-gsl node-lodash agrep sqlite3

sudo npm install bower -g
