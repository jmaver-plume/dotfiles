# -----------------------
# Git Global Configurations
# -----------------------

# Automatically set up a remote for new repositories.
git config --global --add --bool push.autoSetupRemote true

# Configure git to use diff-so-fancy for better 'git diff' visualization.
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global interactive.diffFilter "diff-so-fancy --patch"

# -----------------------
# Custom Git Functions
# -----------------------

# copy_branch
# Copies the current git branch name to the clipboard.
# Usage: copy_branch_name
copy_branch_name() {
  git branch | grep \* | cut -d ' ' -f2 | tee >(pbcopy)
}

# reset_integration_branch
# Resets the local 'integration' branch to match the remote 'origin/integration' branch.
# Usage: reset_integration_branch
reset_integration_branch() {
  git fetch -a || { echo "Fetch failed, aborting"; return 1; }
  git checkout integration || { echo "Checkout failed, aborting"; return 1; }
  git reset --hard origin/integration || { echo "Reset failed, aborting"; return 1; }
}
