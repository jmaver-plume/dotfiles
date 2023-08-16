git config --global --add --bool push.autoSetupRemote true


# Configure git to use diff-so-fancy for git diff 
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global interactive.diffFilter "diff-so-fancy --patch"


# Places the checked out branch name to the pasteboard
copy_branch() {
  git branch | grep \* | cut -d ' ' -f2 | tee >(pbcopy)
}

