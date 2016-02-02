#!/bin/sh 

chmod a+x ./setup-subreddit-recommender-prereqs.sh
chmod a+x ./setup-git-hub.sh
chmod a+x ./setup-postgres.sh

chmod a+x ./download-subreddit-recommender.sh
chmod a+x ./config.sh
chmod a+x ./build-and-run-subreddit-recommender.sh

./setup-subreddit-recommender-prereqs.sh
# ./setup-git-hub.sh
./setup-postgres.sh

# ./download-subreddit-recommender.sh
./config.sh
./build-and-run-subreddit-recommender.sh
