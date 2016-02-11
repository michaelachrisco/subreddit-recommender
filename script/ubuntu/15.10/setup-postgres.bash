#!/usr/bin/env bash

sudo apt-get --yes --install-suggests install postgresql postgresql-contrib pgadmin3

echo "Setting postgres password for user postgres...."
sudo -u postgres psql --db=postgres --command="\password postgres"
sudo -u postgres createuser --superuser $USER
echo "Setting postgres password for user $USER...."
sudo -u postgres psql --command="\password $USER"
