#!/bin/zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Slack Standup
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "Placeholder" }

# Documentation:
# @raycast.author jmaver@plume.com

source ~/.zshrc
jira issue get "$1" -f slack | pbcopy

