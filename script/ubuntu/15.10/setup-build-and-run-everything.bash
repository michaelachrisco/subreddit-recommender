#!/usr/bin/env bash

# chmod a+x ./setup-subreddit-recommender-prereqs.bash
# chmod a+x ./setup-git-hub.bash
# chmod a+x ./setup-postgres.bash

# chmod a+x ./download-subreddit-recommender.bash
# chmod a+x ./config.bash
# chmod a+x ./build-and-run-subreddit-recommender.bash

./setup-subreddit-recommender-prereqs.bash
# ./setup-git-hub.bash
./setup-postgres.bash

./download-subreddit-recommender.bash
./config.bash
./build-and-run-subreddit-recommender.bash
