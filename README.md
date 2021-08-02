# dotfiles

Contains some scripts to install common software and some basic dotfiles.

### Scripts to set up a new (k)ubuntu sytem

Use at your own risk! And don't forget to change the user on _.gitconfig_ after the installation.

## 0- clone the dotfiles

```
sudo apt install git -y
git clone https://github.com/codexico/dotfiles.git
cd dotfiles
```

## 1- Basic install

Copy the dotfiles, remove some bloatware and install a lot of software:

```
./install.sh
```

## 2- (Optional) Install zsh

```
./scripts/install_zsh.sh
```

### Oh-my-zsh

```
./scripts/install_oh-my-zsh.sh
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
./scripts/install_powerline_fonts.sh
```

```
ZSH_THEME="agnoster"
```

Or use a custom theme:

```
cp ~/dotfiles/ohmyzsh/themes/* ~/.oh-my-zsh/custom/themes
```

```
ZSH_THEME="agnoster-fk" or ZSH_THEME="nanotech-fk"
```

Don't forget to change to the powerline fonts, on KDE:

    Konsole > Settings > Configure > Profiles > New Profile > “zsh”
    > Appearance > Select Font > Droid Sans Mono for Powerline
    > Apply > Set as Default

## 3 - Install node with nvm

```
./scripts/installs/install_nvm_node.sh
```

## FunçõesZZ

For brazilian users [FunçõesZZ](https://github.com/funcoeszz/funcoeszz) are included!

[FunçõesZZ](https://github.com/funcoeszz/funcoeszz) are a collection of shell commands, for example, to uppercase, simple math, tv guide, translate en<-->pt_br, ...

```
./scripts/install_funcoeszz.sh
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
