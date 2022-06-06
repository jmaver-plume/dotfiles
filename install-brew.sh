if ! command -v brew; then
  echo 'Installing homebrew'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

_brew_install_package () {
  if brew list $1 &>/dev/null; then
    echo "${1} is already installed"
  else
    brew install $1 && echo "$1 is installed"
  fi
}

for package in "jq" "terminator"; do
  _brew_install_package "$package"
done