# dotfiles

## Usage

```
cd ~/Documents/code
git clone git@github.com:jmaver-plume/dotfiles.git .dotfiles
cd .dotfiles
./install
```

### How to add a new git submodule zsh package

- Add a git submodule.
```shell
git submodule add https://github.com/zsh-users/zsh-syntax-highlighting.git
```
- Add link to `install.conf.yaml`.
```
- link:
    ...other
    ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting: zsh-syntax-highlighting
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
./install
```

## Links

* [Dotbot](https://github.com/anishathalye/dotbot): Dotbot makes installing your dotfiles as easy as git clone $url && cd dotfiles && ./install, even on a freshly installed system!
* [Managing your dotfiles](https://www.anishathalye.com/2014/08/03/managing-your-dotfiles/): Blog post on how to manage dotfiles
* [crzysdrs/dotfiles](https://github.com/crzysdrs/dotfiles): Example of dotfiles configuration provided by writer of Dotbot.
* [anishathalye/dotfiles](https://github.com/anishathalye/dotfiles): Example of dotfiles configuration from writer of Dotbot.
* [iraquitan/dotfiles](https://github.com/iraquitan/iraquitan-dotfiles): Example of dotfiles configuration, which contains setting up `oh-my-zsh`.
