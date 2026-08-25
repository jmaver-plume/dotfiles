source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# -----------------------
# Homebrew Configuration
# -----------------------

# Initialize Homebrew environment variables.
eval "$(/opt/homebrew/bin/brew shellenv)"

# syntax highlighting
eval "$(/opt/homebrew/bin/zsh-patina activate)"


# Pure stuff
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

# Source: https://mijndertstuij.nl/posts/life-is-too-short-for-a-slow-terminal/
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qNmh-24) ]]; then
  compinit -C
else
  compinit
fi


# -----------------------
# Zsh Autosuggestions Configuration
# -----------------------

# Set the highlight style for autosuggestions (must be set before loading plugins)
# Use a dimmed/gray color for suggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'


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

# Source work-specific private zsh configurations if the file exists.
PRIVATE_WORK_FILE=~/.private-work.zsh
if [ -f "$PRIVATE_WORK_FILE" ]; then
  source $PRIVATE_WORK_FILE
fi

# Source home-specific private zsh configurations if the file exists.
PRIVATE_HOME_FILE=~/.private-home.zsh
if [ -f "$PRIVATE_HOME_FILE" ]; then
  source $PRIVATE_HOME_FILE
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

# -----------------------
# BAT Configuration
# -----------------------
# https://github.com/sharkdp/bat#customization
BAT_THEME=ansi


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
# JetBrains Configuration
# -----------------------

# Make WebStorm launchable from CLI
webstorm() {
  open -na "WebStorm.app" --args "$1"
}

# Make IntelliJ launchable from CLI
idea() {
  open -na "IntelliJ IDEA Community Edition.app" --args "$1"
}

# -----------------------
# Java Configuration
# -----------------------

# Java 17 Configuration
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export JAVA_HOME="/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home"

# -----------------------
# Generic Aliases
# -----------------------

# Display the current date in ISO 8601 format.
alias now='echo -n `date -u +%Y-%m-%dT%H:%M:%SZ`'

# Alias for 'git' command for brevity.
alias g="git"

# Alias for 'kubectl' command for brevity.
alias k="kubectl"

alias ll='ls -lG'

# google/zx aliases
alias psync="sync-repositories.mjs --directory '/Users/jmaver/git/code/plume-repositories'"

## Latex
export PATH="/Library/TeX/texbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

## LLM Stuff
alias cl="claude --dangerously-skip-permissions"
