# -----------------------
# Oh My Zsh Configuration
# -----------------------

# Specify the path to the oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set the theme for oh-my-zsh.
# For a random theme each session, set to "random".
# To identify the random theme loaded, use: echo $RANDOM_THEME
# More themes: https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Configure auto-update behavior for oh-my-zsh.
# Uncomment one of the lines below to set the desired behavior.
# zstyle ':omz:update' mode disabled  # Disable automatic updates
zstyle ':omz:update' mode auto      # Enable automatic updates without prompt

# Specify plugins to be loaded by oh-my-zsh.
# Note: Excessive plugins can slow down shell startup.
plugins=(
  zsh-nvm
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Source the main oh-my-zsh script.
source $ZSH/oh-my-zsh.sh

# -----------------------
# Homebrew Configuration
# -----------------------

# Initialize Homebrew environment variables.
eval "$(/opt/homebrew/bin/brew shellenv)"

# -----------------------
# Zoxide Configuration
# -----------------------

# Initialize zoxide, a smarter cd command.
eval "$(zoxide init zsh)"

# -----------------------
# Private Configuration
# -----------------------

# Source private zsh configurations if the file exists.
PRIVATE_FILE=~/.private.zsh
if [ -f "$PRIVATE_FILE" ]; then
  source $PRIVATE_FILE
fi

# -----------------------
# FZF Configuration
# -----------------------

# FZF is a general-purpose command-line fuzzy finder.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# -----------------------
# Path Configuration
# -----------------------

# Add the specified kubernetes-cli version to the PATH.
export PATH="/usr/local/opt/kubernetes-cli@1.22/bin:$PATH"

# Add the user's bin directory to the PATH.
export PATH="$HOME/bin:$HOME/bin/zx:$PATH"


# -----------------------
# History Configuration
# -----------------------

# Configure zsh history behavior.
setopt INC_APPEND_HISTORY      # Append history as commands are issued.
setopt HIST_IGNORE_ALL_DUPS    # Ignore duplicated commands in history.
setopt HIST_SAVE_NO_DUPS       # Don't save duplicated commands.
setopt EXTENDED_HISTORY        # Save timestamp of command execution.
setopt SHARE_HISTORY           # Share command history across terminals.

# -----------------------
# WebStorm Configuration
# -----------------------

# Make WebStorm launchable from CLI
webstorm() {
  open -na "WebStorm.app" --args "$1"
}

# -----------------------
# Generic Aliases
# -----------------------

# Display the current date in ISO 8601 format.
alias iso_date='echo -n `date -u +%Y-%m-%dT%H:%M:%SZ`'

# Alias for 'git' command for brevity.
alias g="git"

# Alias for 'kubectl' command for brevity.
alias k="kubectl"

# Load user-specific environment variables
. "$HOME/.local/bin/env"

# Java 17 Configuration
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export JAVA_HOME="/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home"
