#!/usr/bin/env bash

sudo apt-get --yes install git-daemon-sysvinit \
                           git \
                           nodejs \
                           nodejs-legacy \
                           npm \
                           ruby \
                           ruby2.2 \
                           rails \
                           libgsl0-dev \
                           libgsl0-dbg \
                           ruby-gsl \
                           node-lodash \
                           agrep \
                           sqlite3 \
                           libsqlite3-dev \
                           libpq-dev
                               
sudo npm install bower -g
