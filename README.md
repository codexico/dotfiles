# dotfiles

Contains some scripts to install common software and some basic dotfiles on a
new (k)ubuntu sytem.

Use at your own risk! And don't forget to change the user on _.gitconfig_ after the installation.

## Installation

### 0- clone the dotfiles

```
sudo apt install git -y
git clone https://github.com/codexico/dotfiles.git
cd dotfiles
```

### 1- Basic install

You can run all at the same time: copy the dotfiles to the $HOME, remove some bloatware and install a lot of software:

```
./install.sh
```

Or you can run one at a time running from the folder `scripts`.

### 2- (Optional) Install other aplications

#### 2.1 zsh and oh-my-zsh

```
./scripts/installs/install_zsh.sh
```

```
./scripts/installs/install_oh-my-zsh.sh
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
./scripts/installs/install_powerline_fonts.sh
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

#### 2.2 - node with nvm

```
./scripts/installs/install_nvm_node.sh
```

#### 2.3 FunçõesZZ

For brazilian users [FunçõesZZ](https://github.com/funcoeszz/funcoeszz) are included!

[FunçõesZZ](https://github.com/funcoeszz/funcoeszz) are a collection of shell commands, for example, to uppercase, simple math, tv guide, translate en<-->pt_br, ...

```
./scripts/installs/install_funcoeszz.sh
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
