#!/usr/bin/env bash

sudo apt-get --yes install  git-daemon-sysvinit \
                            git \
                            curl \
                            zlib1g-dev \
                            build-essential \
                            libssl-dev \
                            libreadline-dev \
                            libyaml-dev \
                            libsqlite3-dev \
                            sqlite3 \
                            libxml2-dev \
                            libxslt1-dev \
                            libcurl4-openssl-dev \
                            python-software-properties \
                            libffi-dev \
                            libgsl-dev \
                            libgsl-dbg \
                            agrep \
                            libpq-dev

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL
rbenv install 2.3.1
rbenv global 2.3.1
ruby -v
gem install bundler
rbenv rehash

curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get --yes install nodejs

sudo npm install -g npm@3

sudo apt-get --yes install node-lodash
                               
sudo apt-get --yes install ruby-gsl

sudo npm install -g bower

