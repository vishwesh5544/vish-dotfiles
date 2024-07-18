
#!/bin/bash

# Start the SSH agent and add the key if not already running
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
fi

# Navigate to the directory where this script is located
cd "$(dirname "$0")"

# Copy the .tmux.conf, .zshrc, and the script itself to the repository
cp ~/.tmux.conf ~/.zshrc ./

# Add the files to the git staging area
git add .tmux.conf .zshrc backup_dotfiles.sh README.md

# Commit the changes with a message
git commit -m "Backup dotfiles on $(date)"

# Push the changes to the GitHub repository using SSH
git push origin main

echo "Backup completed!"
