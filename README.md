# dotfiles

Personal macOS dotfiles.

## Usage

```sh
git clone git@github.com:jmaver-plume/dotfiles.git
cd dotfiles
./sync
```

`sync` installs packages from `Brewfile`, initializes the Git submodules, and
links the configuration files into the home directory. It stops if a target
already exists and is not a symlink.

Private Zsh configuration can be placed in `~/.private.zsh`,
`~/.private-work.zsh`, or `~/.private-home.zsh`.
