#!/bin/bash

# Variables
BASE_DIR="/Users/ritvik/Downloads/Practice/Microservices_s"
REPO_URL="https://github.com/ritvikraj-cse/Microservices_s.git"
TEMP_DIR="/tmp/Microservices_s"

# Check for Git installation
if ! command -v git &> /dev/null; then
    echo "Git is not installed. Please install Git and try again."
    exit 1
fi

# Clone the repository
if ! git clone "$REPO_URL" "$TEMP_DIR"; then
    echo "Failed to clone repository."
    exit 1
fi
cd "$TEMP_DIR" || exit

# Initialize git repository if not already initialized
if [ ! -d ".git" ]; then
    git init
fi

# Check if the repository is empty and create an initial commit if needed
if [ -z "$(ls -A)" ]; then
    echo "Repository is empty. Creating an initial commit."
    echo "# Initial commit" > README.md
    git add README.md
    git commit -m "Initial commit"
    git push -u origin main
fi

# Ensure main branch exists and switch to it
if ! git rev-parse --verify main >/dev/null 2>&1; then
    echo "Creating main branch."
    git checkout -b main
    git push -u origin main
else
    git checkout main
fi

# Copy files from the 'main' directory to the root of the 'main' branch
git rm -r --cached .
rm -rf *
if [ -d "$BASE_DIR/main" ]; then
    cp -r "$BASE_DIR/main/." .
fi
git add .
git commit -m "Add files from main directory"
git push -f origin main

# Dynamically generate the list of directories to push as branches
services=()
for dir in "$BASE_DIR"/*; do
    if [ -d "$dir" ]; then
        service_name=$(basename "$dir")
        # Exclude 'main' or any other directories you don't want to push
        if [ "$service_name" != "main" ]; then
            services+=("$service_name")
        fi
    fi
done

for service in "${services[@]}"; do
    # Create a new branch for each service
    if ! git checkout -b "$service"; then
        echo "Failed to create or switch to branch $service."
        exit 1
    fi

    # Remove all files in the repository
    git rm -r --cached .
    rm -rf *

    # Copy the files inside the respective service directory to the root of the branch
    if [ -d "$BASE_DIR/$service" ]; then
        cp -r "$BASE_DIR/$service/." .
    else
        echo "Directory $BASE_DIR/$service does not exist."
        continue
    fi

    # Add files to git
    git add .
    git commit -m "Add files from $service"

    # Push the branch to GitHub
    if ! git push -f origin "$service"; then
        echo "Failed to push branch $service."
        exit 1
    fi

    # Checkout to main branch to create the next branch
    git checkout main
done

# Clean up
rm -rf "$TEMP_DIR"

echo "All branches pushed successfully."

