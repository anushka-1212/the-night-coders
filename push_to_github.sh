#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if git is installed
if ! command_exists git; then
    echo "Error: Git is not installed. Please install Git first."
    exit 1
fi

# Get the current directory name for the repository name
REPO_NAME=$(basename "$(pwd)")

# Initialize git if not already initialized
if [ ! -d ".git" ]; then
    echo "Initializing git repository..."
    git init
fi

# Add all files to staging
echo "Adding files to staging..."
git add .

# Get commit message from user
read -p "Enter commit message: " COMMIT_MESSAGE

# Commit changes
echo "Committing changes..."
git commit -m "$COMMIT_MESSAGE"

# Check if remote origin exists
if ! git remote | grep -q "origin"; then
    read -p "Enter GitHub repository URL (e.g., https://github.com/username/repo.git): " REPO_URL
    git remote add origin "$REPO_URL"
fi

# Push to GitHub
echo "Pushing to GitHub..."
git push -u origin main

# Check if push was successful
if [ $? -eq 0 ]; then
    echo "Successfully pushed to GitHub!"
else
    echo "Error: Failed to push to GitHub. Please check your credentials and try again."
    exit 1
fi 