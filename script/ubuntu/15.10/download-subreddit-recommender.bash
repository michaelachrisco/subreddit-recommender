#!/bin/bash

mkdir ~/repos
cd ~/repos
mkdir git
cd git
git clone https://github.com/michaelachrisco/subreddit-recommender.git
cd subreddit-recommender
ls -l
git status

cp ./config/database.yml.ig ./config/database.yml
cp ./config/secrets.yml.ig ./config/secrets.yml
