# -----------------------
# Homebrew Configuration
# -----------------------

# Support both Apple Silicon and Intel Homebrew installations.
if (( $+commands[brew] )); then
  eval "$(brew shellenv)"
elif [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

if (( $+commands[brew] )); then
  fpath+=("$(brew --prefix)/share/zsh/site-functions")
fi

# -----------------------
# History Configuration
# -----------------------

HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

setopt INC_APPEND_HISTORY      # Append history as commands are issued.
setopt HIST_IGNORE_ALL_DUPS    # Ignore duplicated commands in history.
setopt HIST_SAVE_NO_DUPS       # Don't save duplicated commands.
setopt EXTENDED_HISTORY        # Save timestamp and duration.
setopt SHARE_HISTORY           # Share command history across terminals.

# -----------------------
# Completion and Plugins
# -----------------------

autoload -Uz compinit
if [[ -n "${ZDOTDIR:-$HOME}/.zcompdump"(#qNmh-24) ]]; then
  compinit -C
else
  compinit
fi

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'

[[ -r "$HOME/.zsh/fzf-tab/fzf-tab.plugin.zsh" ]] &&
  source "$HOME/.zsh/fzf-tab/fzf-tab.plugin.zsh"
[[ -r "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] &&
  source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"

if (( $+commands[fzf] )); then
  source <(fzf --zsh)
fi

if (( $+commands[zsh-patina] )); then
  eval "$(zsh-patina activate)"
fi

autoload -Uz promptinit
promptinit
if (( $+functions[prompt_pure_setup] )); then
  prompt pure
fi

if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh)"
fi

# -----------------------
# Private Configuration
# -----------------------

for private_file in \
  "$HOME/.private.zsh" \
  "$HOME/.private-work.zsh" \
  "$HOME/.private-home.zsh"
do
  [[ -r "$private_file" ]] && source "$private_file"
done
unset private_file

# -----------------------
# Tool Configuration
# -----------------------

export BAT_THEME=ansi

if (( $+commands[brew] )); then
  openjdk_prefix="$(brew --prefix openjdk@17 2>/dev/null)"
  if [[ -n "$openjdk_prefix" ]]; then
    export PATH="$openjdk_prefix/bin:$PATH"
    export JAVA_HOME="$openjdk_prefix/libexec/openjdk.jdk/Contents/Home"
  fi
  unset openjdk_prefix
fi

[[ -d /Library/TeX/texbin ]] && export PATH="/Library/TeX/texbin:$PATH"

# -----------------------
# JetBrains Configuration
# -----------------------

webstorm() {
  open -na "WebStorm.app" --args "$@"
}

idea() {
  open -na "IntelliJ IDEA Community Edition.app" --args "$@"
}

# -----------------------
# Aliases
# -----------------------

alias now='date -u +%Y-%m-%dT%H:%M:%SZ'
alias g='git'
alias k='kubectl'
alias ll='ls -lG'
