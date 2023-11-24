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
  zsh-autosuggestions
  git
  zsh-syntax-highlighting
  zsh-you-should-use
)

# Source the main oh-my-zsh script.
source $ZSH/oh-my-zsh.sh

# -----------------------
# NVM (Node Version Manager) Configuration
# -----------------------

# Specify the path to the NVM installation.
export NVM_DIR="$HOME/.nvm"

# Load NVM and its bash completion.
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Automatically switch Node.js version based on .nvmrc file in directory.
# More info: https://github.com/nvm-sh/nvm#zsh
autoload -U add-zsh-hook
load-nvmrc() {
  # ... [content unchanged]
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# -----------------------
# Homebrew Configuration
# -----------------------

# Initialize Homebrew environment variables.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load autojump, a directory navigation tool.
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

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

# Enable auto-directory change without the need for 'cd'.
setopt autocd

# -----------------------
# TheFuck Configuration
# -----------------------

# Initialize thefuck, a magnificent app to correct previous console command.
eval $(thefuck --alias)

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
# Generic Aliases
# -----------------------

# Search through command history with fzf.
alias hist='history | fzf'

# Quick navigation to personal code directory.
alias personal='cd ~/Documents/code/personal'

# Display the current date in ISO 8601 format.
alias iso_date='echo -n `date -u +%Y-%m-%dT%H:%M:%SZ`'

# Make WebStorm launchable from CLI
webstorm() {
  open -na "WebStorm.app" --args "$1"
}
