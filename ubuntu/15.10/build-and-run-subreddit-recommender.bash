#!/bin/bash

bundle install --path vendor/bundle
rake bower:install
rake --describe | more

rake db:setup
rake subreddits:seed
rake subreddits:relate
rake
rails server
