#!/bin/bash

echo ""
echo "🚀 Let's update the Snowflake version!"
echo ""

#logMethod
🔶() {
    echo -e "\n🔶 $1\n"
}

# Helper function to display an error message and exit
error_exit() {
    echo "❌ Error: $1"
    exit 1
}

# Function to check if there are uncommitted changes
has_uncommitted_changes() {
    if ! git diff-index --quiet HEAD --; then
        return 0 # Uncommitted changes exist
    else
        return 1 # No uncommitted changes
    fi
}

# Function to check if a branch exists
check_branch_exists() {
    local branch=$1
    if git show-ref --verify --quiet refs/heads/"$branch"; then
        error_exit "Branch '$branch' already exists. Choose another version number."
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

# If there are uncommitted changes, prompt the user for a commit message
if has_uncommitted_changes; then
    echo ""
    echo "⚠️  You have uncommitted changes."
    echo "If they are BREAKING CHANGES, we will commit them to the new branch, otherwise cancel and commit your changes."
    echo "Enter a commit message for the breaking changes: "
    read -r user_commit_message
fi

🔶 'Get latest tag'
old_version=$(get_latest_tag)
echo "ℹ️  The latest version is $old_version"
echo ""

# Prompt for the new version and old build number
read -p "Enter the new version (we override current pubspec): " new_version
read -p "Enter the next version (temporary in pubspec): " next_version
read -p "Enter the next build number (next branch number): " next_build_number

echo -e "\n🔶 Check that new branch v${next_build_number} doesn't already exist"
check_branch_exists "v${next_build_number}"

🔶 'Create and switch to the new branch v${next_build_number}'
git checkout -b "v${next_build_number}" || error_exit "Failed to create and switch to the branch 'v${next_build_number}'."

🔶 'Commit last changed to new branch'
if has_uncommitted_changes; then
    git add .
    git commit -m "$user_commit_message" || error_exit "Failed to commit uncommitted changes."
fi

🔶 'Replace version in pubspec.yaml'
sed -i '' "s/^version:.*/version: ${new_version}+${next_build_number}/" pubspec.yaml

🔶 'Commit version update'
git commit -am "pub: update version to ${new_version}+${next_build_number}" || error_exit "Failed to commit version update."

🔶 'Checkout master'
git checkout master || error_exit "Failed to switch to master branch."

🔶 'Merge v${next_build_number} into master'
git merge "v${next_build_number}" -m "Merge v${next_build_number} into master" --no-ff || error_exit "Failed to merge branch 'v${next_build_number}'."

🔶 'Fetch latest changes and display log\n'
git pull || error_exit "Failed to pull the latest changes from the remote repository."
git --no-pager log --date=format:"%Y-%m-%d %H:%M:%S" --pretty=format:"%C(yellow)%h%Cgreen -- %ad %C(magenta)[%an]%Creset : %s" -10 || error_exit "Failed to display the git log."

🔶 'Tag the commit with ${new_version}'
git tag "${new_version}" -m "Release ${new_version}" || error_exit "Failed to tag the commit with version ${new_version}."

🔶 'Push the tags to the remote repository'
git push --tags || error_exit "Failed to push the tags to the remote repository."

🔶 'Update the NEXT version and build number in pubspec.yaml'
sed -i '' "s/^version:.*/version: ${next_version}+${next_build_number}/" pubspec.yaml

🔶 'Commit the changes for next version'
git commit -am "[DELIVERY ${old_version}]: upgrade version to ${new_version}" || error_exit "Failed to commit the version update."

🔶 'Push changes to master'
git push || error_exit "Failed to push the changes to the master branch."

🔶 'Switch back to v${next_build_number}'
git checkout "v${next_build_number}" || error_exit "Failed to switch back to 'v${next_build_number}'."

🔶 'Push new branch'
git push --set-upstream origin "v${next_build_number}" || error_exit "Failed to push the branch 'v${next_build_number}'."

# Print a message indicating completion
echo ""
echo "✅ Done."
echo ""
echo "⚠️ Don't forget to update hello_riverpod with the new version: ${new_version}"