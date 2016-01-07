#!/bin/bash

./script/ubuntu/15.10/setup-subreddit-recommender-prereqs.bash
#./script/ubuntu/15.10/setup-git-hub.bash
#./script/ubuntu/15.10/setup-postgres.bash

./script/ubuntu/15.10/download-subreddit-recommender.bash
./script/ubuntu/15.10/build-and-run-subreddit-recommender.bash
