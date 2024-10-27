# -----------------------
# Git Global Configurations
# -----------------------

# Automatically set up a remote for new repositories.
git config --global --add --bool push.autoSetupRemote true

# Configure git to use diff-so-fancy for better 'git diff' visualization.
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global interactive.diffFilter "diff-so-fancy --patch"