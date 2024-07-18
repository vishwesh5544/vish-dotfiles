#!/bin/bash

# Navigate to the directory where this script is located
cd "$(dirname "$0")"

# Copy the .tmux.conf and .zshrc files to the repository
cp ~/.tmux.conf ~/.zshrc ./

# Add the files to the git staging area
git add .tmux.conf .zshrc

# Commit the changes with a message
git commit -m "Backup .tmux.conf and .zshrc on $(date)"

# Push the changes to the GitHub repository
git push origin main

echo "Backup completed!"
