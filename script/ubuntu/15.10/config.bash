#!/bin/bash

pushd ~/repos/git/subreddit-recommender/config/
cp database.yml.ig database.yml
cp secrets.yml.ig secrets.yml
popd
