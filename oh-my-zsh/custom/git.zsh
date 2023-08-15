git config --global --add --bool push.autoSetupRemote true


# Places the checked out branch name to the pasteboard
copy_branch() {
  git branch | grep \* | cut -d ' ' -f2 | tee >(pbcopy)
}

