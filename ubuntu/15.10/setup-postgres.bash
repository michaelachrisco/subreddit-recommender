#!/bin/bash

sudo apt-get --install-suggests install postgresql postgresql-contrib pgadmin3 libsqlite3-dev

sudo -u postgres psql --db=postgres --command="\password postgres"
sudo -u postgres createuser --superuser $USER
sudo -u postgres psql --command="\password $USER"
