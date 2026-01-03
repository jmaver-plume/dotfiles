# dotfiles

## Usage

```
git clone git@github.com:jmaver-plume/dotfiles.git
cd dotfiles
./sync
```

### How to add a new git submodule zsh package

- Add a git submodule.
```shell
git submodule add https://github.com/zsh-users/zsh-syntax-highlighting.git
```
- Add plugin to `zshrc`.
```
plugins=(
  ...other
  zsh-syntax-highlighting
)
```
- Run the install script.
```shell
./sync
```
