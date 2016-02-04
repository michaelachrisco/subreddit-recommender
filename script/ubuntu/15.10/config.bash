#!/usr/bin/env bash

pushd ~/repos/git/michaelachrisco/subreddit-recommender/config/
cp database.yml.ig database.yml
cp secrets.yml.ig secrets.yml
popd
