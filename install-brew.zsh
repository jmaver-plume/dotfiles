install_package() {
  local package="$1"

  if brew list "$package" &> /dev/null; then
      echo "Already installed: $package"
      return
  fi

  # Install the package
  brew install "$package" && echo "Installed: $package"

  # Additional setup for specific packages
  if [[ "$package" == "fzf" ]]; then
    $(brew --prefix)/opt/fzf/install
  fi
}

# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Installed: homebrew"
else
    echo "Already installed: homebrew"
fi

# Install desired packages
local packages=(
  "jq"
  "fzf"
  "zoxide"
  "ripgrep"
  "MonitorControl"
  "tldr"
  "wget"
  "diff-so-fancy"
)
for package in "${packages[@]}"; do
    install_package "$package"
done
