is_brew_installed() {
  command -v brew &> /dev/null
}

install_homebrew() {
  echo "Installing homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

is_package_installed() {
  brew list "$1" &> /dev/null
}

install_package() {
  local package="$1"

  if is_package_installed "$package"; then
      echo "$package is already installed"
      return
  fi

  echo "Installing $package ..."
  brew install "$package" && echo "$package is installed"

  # Post-install actions
  post_install_actions "$package"
}

post_install_actions() {
  local package="$1"

  if [[ "$package" == "fzf" ]]; then
    $(brew --prefix)/opt/fzf/install
  fi
}

main() {
  if ! is_brew_installed; then
      install_homebrew
  else
      echo "Homebrew is already installed"
  fi

  # List of packages
  local packages=(
    "jq" 
    "fzf" 
    "kcat" 
    "autojump" 
    "fd" 
    "ripgrep" 
    "MonitorControl" 
    "bat" 
    "exa" 
    "thefuck"  
    "tldr"  
    "diff-so-fancy"  
  )

  for package in "${packages[@]}"; do
      install_package "$package"
  done
}

# Start the main function
main
