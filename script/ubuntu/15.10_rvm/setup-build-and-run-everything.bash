#!/usr/bin/env bash

# Set up prerequisites....
sudo apt-get remove --purge ruby #ruby-rvm
sudo apt-get remove --purge ruby-rvm
sudo rm -rf /usr/share/ruby-rvm /etc/rmvrc /etc/profile.d/rvm.sh
rm -rf ~/.rvm* ~/.gem/ ~/.bundle*

sudo apt-get update
sudo apt-get --yes install git \
                           build-essential \
                           curl \
                           wget

echo "[[ -s '${HOME}/.rvm/scripts/rvm' ]] && source '${HOME}/.rvm/scripts/rvm'" >> ~/.bashrc

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

curl -L https://get.rvm.io | bash -s stable

sudo apt-get --yes install git-daemon-sysvinit \
                           git-core \
                           nodejs \
                           nodejs-legacy \
                           npm \
                           openssl \
                           libreadline6 \
                           libreadline6-dev \
                           zlib1g \
                           zlib1g-dev \
                           libssl-dev \
                           libyaml-dev \
                           libxml2-dev \
                           libxslt-dev \
                           autoconf \
                           libc6-dev \
                           ncurses-dev \
                           automake \
                           libtool \
                           bison \
                           subversion \
                           pkg-config \
                           libgsl0-dev \
                           libgsl0-dbg \
                           libpq-dev \
                           sqlite3 \
                           libsqlite3-dev

curl -L https://get.rvm.io | bash -s stable --ruby
source ~/.rvm/scripts/rvm
rvm reload
rvm use default

gem install cyaml

sudo npm install bower -g

gem install bundler

# Set up Postgres....
sudo apt-get --yes install postgresql \
						   postgresql-contrib \
						   pgadmin3

echo "Setting postgres password for user postgres...."
sudo -u postgres psql --db=postgres --command="\password postgres"
sudo -u postgres createuser --superuser $USER
echo "Setting postgres password for user $USER...."
sudo -u postgres psql --command="\password $USER"

# Copy .yml files, set RAILS_ENV....
pushd ~/repos/git/michaelachrisco/subreddit-recommender/config/
cp database.yml.ig database.yml
cp secrets.yml.ig secrets.yml
popd

export RAILS_ENV=development

# Run initial rake tasks....
cd ~/repos/git/michaelachrisco/subreddit-recommender/
bundle install --path vendor/bundle
bundle exec rake bower:install
bundle exec rake db:reset

# Seed and relate subreddits....
bundle exec rake subreddits:seed
bundle exec rake subreddits:relate_tfidf

# Start rails server....
bundle exec rails server
