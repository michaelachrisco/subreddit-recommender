#!/usr/bin/env bash

sudo apt-get --yes install git-daemon-sysvinit \
                           git \
                           ruby \
                           rails \
                           libgsl-dev \
                           libgsl-dbg \
                           ruby-gsl \
                           agrep \
                           sqlite3 \
                           libsqlite3-dev \
                           libpq-dev

curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get --yes install nodejs

sudo npm install -g npm@3

sudo apt-get --yes install node-lodash
                               
sudo npm install -g bower

