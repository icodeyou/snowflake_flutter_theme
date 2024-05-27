#!/bin/bash

echo "🚀 Let's update the Snowflake version !"

# Function to check for uncommitted changes
check_uncommitted_changes() {
    if ! git diff-index --quiet HEAD --; then
        echo "Error: You have uncommitted changes. Please commit or stash them before running this script."
        exit 1
    fi
}

# Function to check if a branch exists
check_branch_exists() {
    local branch=$1
    if ! git show-ref --verify --quiet refs/heads/"$branch"; then
        echo "Error: Branch '$branch' does not exist."
        exit 1
    fi
}

# Function to get the latest tag
get_latest_tag() {
    git fetch --tags || exit
    latest_tag=$(git describe --tags `git rev-list --tags --max-count=1`)
    if [ -z "$latest_tag" ]; then
        echo "Error: No tags found in the repository."
        exit 1
    fi
    echo $latest_tag
}

# Check for uncommitted changes
check_uncommitted_changes

# Get the latest tag
latest_tag=$(get_latest_tag)
echo "The latest version is $latest_tag"

# Prompt for the new version and old build number
read -p "Enter the new version : " new_version
read -p "Enter the new build number : " new_build_number

# Increment the build number
next_build_number=$((new_build_number + 1))

# Check if the old build branch exists
check_branch_exists "v${new_build_number}"

# Merge branch v${new_build_number} with the commit message 'new status colors'
git merge "v${new_build_number}" -m 'new status colors' --no-ff || exit

# Fetch the latest changes from the remote repository and display the log
git pull || exit
git log --oneline --decorate --graph --all || exit

# Tag the commit with the tag ${old_version} and the message 'new status colors'
git tag "${old_version}" -m 'new status colors' || exit

# Push the tags to the remote repository
git push --tags || exit

# Update the version and build number in pubspec.yaml
sed -i '' "s/version: ${old_version}+[0-9]*/version: ${new_version}+${next_build_number}/" pubspec.yaml || exit

# Commit the changes with the message '[DELIVERY ${old_version}]: upgrade version to ${new_version}'
git commit -am "[DELIVERY ${old_version}]: upgrade version to ${new_version}" || exit

# Push the changes to the remote repository
git push || exit

# Create and switch to a new branch v${new_build_number}
git checkout -b "v${next_build_number}" || exit

# Print a message indicating completion
echo "Done. You can do 'cu' in your project"
