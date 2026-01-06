# -----------------------
# Git Global Configurations
# -----------------------

# Automatically set up a remote for new repositories.
git config --global --add --bool push.autoSetupRemote true

# Configure git to use diff-so-fancy for better 'git diff' visualization.
git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global delta.side-by-side true
git config --global delta.hunk-header-style raw
git config --global delta.hunk-header-decoration-style ul
git config --global merge.conflictStyle zdiff3


# -----------------------
# Custom Git Functions
# -----------------------


# gbranch
# Copies the current git branch name to the clipboard.
# Usage: gbranch
gbranch() {
  git branch | grep \* | cut -d ' ' -f2 | tee >(pbcopy)
}

# greset
# Resets the local 'integration' branch to match the remote 'origin/integration' branch.
# Usage: greset
greset() {
  git fetch -a || { echo "Fetch failed, aborting"; return 1; }
  git checkout integration || { echo "Checkout failed, aborting"; return 1; }
  git reset --hard origin/integration || { echo "Reset failed, aborting"; return 1; }
}

# grename
# Renames the current Git branch to a new name and updates the remote branch.
# Usage: grename new_branch_name
grename() {
    # Check if desired branch name is provided
    if [ "$#" -ne 1 ]; then
        echo "Error: New branch name not specified."
        echo "Usage: grename new_branch_name"
        return 1
    fi

    # Get the current branch name
    local current_branch
    current_branch=$(git rev-parse --abbrev-ref HEAD)

    # Check if current branch is retrieved successfully
    if [ -z "$current_branch" ]; then
        echo "Error: Could not determine the current branch."
        return 1
    fi

    # Rename the current branch
    git branch -m "$1"

    # Change the remote tracking branch
    git push origin -u "$1"

    echo "Branch renamed from '$current_branch' to '$1' and remote updated."
}
