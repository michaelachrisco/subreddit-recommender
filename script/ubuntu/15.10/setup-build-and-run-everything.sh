#!/usr/bin/env bash

./setup-subreddit-recommender-prereqs.sh
# ./setup-git-hub.sh
./setup-postgres.sh

./download-subreddit-recommender.sh
./config.sh

export RAILS_ENV=development

./build-and-run-subreddit-recommender.sh

