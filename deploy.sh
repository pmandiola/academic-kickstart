#!/bin/bash

echo -e "\033[0;32mBuilding project...\033[0m"

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

echo -e "\033[0;32mDeploying updates to Github...\033[0m"

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Go To Public folder
cd public

echo -e "\033[0;32mDeploying website...\033[0m"

# Add changes to git.
git add .

# Commit changes.
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..