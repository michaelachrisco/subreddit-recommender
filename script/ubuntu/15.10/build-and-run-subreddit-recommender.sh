#!/bin/sh 

cd ~/repos/git/michaelachrisco/
bundle install --path vendor/bundle
rake bower:install
#rake --describe | more

rake db:reset
rake subreddits:seed
rake subreddits:relate
rails server
