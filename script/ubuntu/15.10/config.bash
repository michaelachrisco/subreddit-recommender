#!/usr/bin/env bash

pushd /vagrant/config/
cp database.yml.ig database.yml
cp secrets.yml.ig secrets.yml
popd
