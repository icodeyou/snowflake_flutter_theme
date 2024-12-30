#!/bin/bash

echo ""
echo "🚀 Let's update the Snowflake version!"
echo ""

# Function to check for uncommitted changes
check_uncommitted_changes() {
    if ! git diff-index --quiet HEAD --; then
        echo "❌ Error: You have uncommitted changes. Please commit or stash them before running this script."
        exit 1
    fi
}

# Function to check if a branch exists
check_branch_exists() {
    local branch=$1
    if ! git show-ref --verify --quiet refs/heads/"$branch"; then
        echo "❌ Error: Branch '$branch' does not exist."
        exit 1
    fi
}

# Function to get the latest tag
get_latest_tag() {
    git fetch --tags || exit
    old_version=$(git describe --tags $(git rev-list --tags --max-count=1))
    if [ -z "$old_version" ]; then
        echo "❌ Error: No tags found in the repository."
        exit 1
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

# Merge branch v${new_build_number} with the provided commit message
git merge "v${new_build_number}" -m "$commit_message" --no-ff || exit

# Fetch the latest changes from the remote repository and display the log
git pull || exit
git --no-pager log --date=format:"%Y-%m-%d %H:%M:%S" --pretty=format:"%C(yellow)%h%Cgreen -- %ad %C(magenta)[%an]%Creset : %s" -10 || exit

# Tag the commit with the tag ${new_version} and the provided commit message
git tag "${new_version}" -m "$commit_message" || exit

# Push the tags to the remote repository
git push --tags || exit

# Update the version and build number in pubspec.yaml
sed -i '' "s/version: ${new_version}+[0-9]*/version: ${next_version}+${next_build_number}/" pubspec.yaml || exit

# Commit the changes with the message '[DELIVERY ${old_version}]: upgrade version to ${new_version}'
git commit -am "[DELIVERY ${old_version}]: upgrade version to ${new_version}" || exit

# Push the changes to master
git push || exit

# Create and switch to a new branch v${next_build_number}
git checkout -b "v${next_build_number}" || exit

# Push new branch
git push || exit

# Print a message indicating completion
echo ""
echo "✅ Done."
echo ""
echo "⚠️ Don't forget to update hello_riverpod with the new version: ${new_version}"