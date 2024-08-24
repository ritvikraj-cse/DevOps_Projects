#!/bin/bash

# Fetch all branches from the remote
git fetch --all

# List all remote branches
branches=$(git branch -r | grep -v '\->')

# Loop through each branch and create a local branch
for branch in $branches; do
    # Extract the branch name (remove the 'origin/' prefix)
    local_branch=$(echo $branch | sed 's/origin\///')
    
    # Checkout the branch locally
    git checkout -b $local_branch $branch
done
