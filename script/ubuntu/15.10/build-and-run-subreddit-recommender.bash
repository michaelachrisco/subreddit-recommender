#!/usr/bin/env bash

cd ~/repos/git/michaelachrisco/subreddit-recommender/
bundle install --path vendor/bundle
bundle exec rake bower:install
#rake --describe | more

bundle exec rake db:reset
bundle exec rake subreddits:seed
bundle exec rake subreddits:relate_tfidf
bundle exec rails server
