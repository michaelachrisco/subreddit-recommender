#!/usr/bin/env bash

sudo apt-get --yes                    install synaptic git-daemon-sysvinit gitg
sudo apt-get --yes --install-suggests install nodejs
sudo apt-get --yes --install-suggests install nodejs-legacy
sudo apt-get --yes --install-suggests install npm ruby
sudo apt-get --yes --install-suggests install rails git libgsl0-dev libgsl0-dbg ruby-gsl node-lodash agrep sqlite3 libsqlite3-dev #git-hub
sudo apt-get --yes                    install libpq-dev

sudo npm install bower -g
