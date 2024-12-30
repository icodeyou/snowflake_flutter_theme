#!/bin/bash

echo ""
echo "🚀 Let's update the Snowflake version!"
echo ""

# Helper function to display an error message and exit
error_exit() {
    echo "❌ Error: $1"
    exit 1
}

# Function to check for uncommitted changes
check_uncommitted_changes() {
    if ! git diff-index --quiet HEAD --; then
        error_exit "You have uncommitted changes. Please commit or stash them before running this script."
    fi
}

# Function to check if a branch exists
check_branch_exists() {
    local branch=$1
    if ! git show-ref --verify --quiet refs/heads/"$branch"; then
        error_exit "Branch '$branch' does not exist."
    fi
}

# Function to get the latest tag
get_latest_tag() {
    git fetch --tags || error_exit "Failed to fetch tags from the remote repository."
    old_version=$(git describe --tags $(git rev-list --tags --max-count=1))
    if [ -z "$old_version" ]; then
        error_exit "No tags found in the repository."
    fi
    echo "$old_version"
}

# Check for uncommitted changes
check_uncommitted_changes

# Get the latest tag
old_version=$(get_latest_tag)
echo "ℹ️  The latest version is $old_version"
echo ""

# Prompt for the new version and old build number
read -p "Enter the new version: " new_version
read -p "Enter the next version: " next_version
read -p "Enter the next build number (next branch number): " next_build_number
read -p "Enter the commit message for the merge and tag: " commit_message

# Increment the build number
new_build_number=$((next_build_number - 1))

# Check if the old build branch exists
check_branch_exists "v${new_build_number}"

# [CHECK] SED NEW
# Before push, update the NEW version and build number in pubspec.yaml, if it wasn't already done
sed -i '' "s/^version:.*/version: ${new_version}+${new_build_number}/" pubspec.yaml
# Commit if necessary
git commit -am "pub: update version to ${new_version}+${new_build_number}"

# Merge branch v${new_build_number} with the provided commit message
git merge "v${new_build_number}" -m "$commit_message" --no-ff || error_exit "Failed to merge branch 'v${new_build_number}'."

# Fetch the latest changes from the remote repository and display the log
git pull || error_exit "Failed to pull the latest changes from the remote repository."
git --no-pager log --date=format:"%Y-%m-%d %H:%M:%S" --pretty=format:"%C(yellow)%h%Cgreen -- %ad %C(magenta)[%an]%Creset : %s" -10 || error_exit "Failed to display the git log."

# Tag the commit with the tag ${new_version} and the provided commit message
git tag "${new_version}" -m "$commit_message" || error_exit "Failed to tag the commit with version ${new_version}."

# Push the tags to the remote repository
git push --tags || error_exit "Failed to push the tags to the remote repository."

# [CHECK] SED NEXT
# Update the NEXT version and build number in pubspec.yaml
sed -i '' "s/^version:.*/version: ${next_version}+${next_build_number}/" pubspec.yaml
# Commit the changes with the message '[DELIVERY ${old_version}]: upgrade version to ${new_version}'
git commit -am "[DELIVERY ${old_version}]: upgrade version to ${new_version}" || error_exit "Failed to commit the version update."

# Push the changes to master
git push || error_exit "Failed to push the changes to the master branch."

# Create and switch to a new branch v${next_build_number}
git checkout -b "v${next_build_number}" || error_exit "Failed to create and switch to the branch 'v${next_build_number}'."

# Push new branch
git push || error_exit "Failed to push the branch 'v${next_build_number}'."

# Print a message indicating completion
echo ""
echo "✅ Done."
echo ""
echo "⚠️ Don't forget to update hello_riverpod with the new version: ${new_version}"