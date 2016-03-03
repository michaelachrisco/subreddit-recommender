#!/usr/bin/env bash

./setup-subreddit-recommender-prereqs.bash
# ./setup-git-hub.bash
./setup-postgres.bash

./download-subreddit-recommender.bash
./config.bash

export RAILS_ENV=development

./build-and-run-subreddit-recommender.bash
