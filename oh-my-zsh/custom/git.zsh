git config --global --add --bool push.autoSetupRemote true

# Configure git to use diff-so-fancy for git diff
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global interactive.diffFilter "diff-so-fancy --patch"

# Usage: copy_branch_name
copy_branch() {
  git branch | grep \* | cut -d ' ' -f2 | tee >(pbcopy)
}

# Usage: reset_integration_branch
reset_integration_branch() {
  git fetch -a || { echo "Fetch failed, aborting"; return 1; }
  git checkout integration || { echo "Checkout failed, aborting"; return 1; }
  git reset --hard origin/integration || { echo "Reset failed, aborting"; return 1; }
}

