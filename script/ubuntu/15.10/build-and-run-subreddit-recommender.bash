#!/usr/bin/env bash

cd ~/repos/git/michaelachrisco/subreddit-recommender/
bundle install --path vendor/bundle
rake bower:install
#rake --describe | more

rake db:reset
rake subreddits:seed
rake subreddits:relate
rails server
