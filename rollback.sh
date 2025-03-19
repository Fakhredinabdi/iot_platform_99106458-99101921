#!/bin/bash

# Script to rollback to the last stable commit
# Fetch all tags and checkout the last stable tag
echo "Fetching all tags from remote..."
git fetch --tags

# Finding the last stable tag
last_stable_tag=$(git describe --tags `git rev-list --tags --max-count=1`)
echo "Last stable tag found: $last_stable_tag"

# Checkout to the last stable tag
echo "Checking out to $last_stable_tag"
git checkout $last_stable_tag

# Instructions to redeploy the application may vary based on the deployment setup
echo "Rollback to $last_stable_tag completed. Proceed with the redeployment."
