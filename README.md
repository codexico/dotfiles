# dotfiles

### Scripts to set up a new (k)ubuntu sytem

Use at your own risk! And don't forget to change the user on _.gitconfig_ after the installation.

## 0- clone the dotfiles

```
sudo apt-get install git -y
git clone https://github.com/codexico/dotfiles.git
cd dotfiles
```

## 1- Basic install

Copy the dotfiles, remove some bloatware and install a lot of software:

```
./install.sh
```

> Virtual Machine Note:
>
> When installing on a VM, replace `install.sh` for `install_vm.sh`, it has less
> software to install.

## 2- (Optional) Install zsh

```
./install_zsh.sh
```

### Oh-my-zsh

```
./install_oh-my-zsh.sh
```

Recomended plugins for zsh:

```
plugins=(
  git
  fasd
)
```

Recomended theme for zsh:

```
./install_powerline_fonts.sh
```

```
ZSH_THEME="agnoster"
```

Don't forget to change to the powerline fonts, on KDE:

    Konsole > Settings > Configure > Profiles > New Profile > “zsh”
    > Appearance > Select Font > Droid Sans Mono for Powerline
    > Apply > Set as Default

## 3 - Install node with nvm

```
./install_languages.sh
```

## FunçõesZZ

For brazilian users it's included the FunçõesZZ!

https://github.com/funcoeszz/funcoeszz is a collection of shell commands, for example, to uppercase, simple math, tv guide, translate en<-->pt_br, ...

```
./install_funcoeszz.sh
```

## Feedback

Suggestions/improvements [please](https://github.com/codexico/dotfiles/issues)!

## Inspiration

https://dotfiles.github.io/

https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789

http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/

https://github.com/paulmillr/dotfiles

https://github.com/webpro/dotfiles

https://github.com/mathiasbynens/dotfiles
