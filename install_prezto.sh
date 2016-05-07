#!/usr/bin/env zsh

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";

ln -sv "$DOTFILES_DIR/.zprestorc" ~/.zprestorc

echo "installing zsh";
sudo apt-get install -y zsh

echo "installing powerline fonts";
git clone https://github.com/powerline/fonts.git tmpfonts
./tmpfonts/install.sh
rm -rf tmpfonts

echo "clonning prezto";
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

echo "setup prezto";
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo "changind default shell to zsh";
chsh -s /bin/zsh

echo "\n";
echo "============================";
echo "please logout an login again";
echo "============================";
echo "\n";

if [[ "$XDG_CURRENT_DESKTOP" == "KDE" ]]; then
    qdbus org.kde.ksmserver /KSMServer logout 1 0 0
elif [[ "$XDG_CURRENT_DESKTOP" == "Unity" ]]; then
    gnome-session-quit --logout
elif [[ "$XDG_CURRENT_DESKTOP" == "GNOME" ]]; then
    gnome-session-quit --logout
elif [[ "$XDG_CURRENT_DESKTOP" == "XFCE" ]]; then
    xfce4-session-logout --logout
elif [[ "$XDG_CURRENT_DESKTOP" == "MATE" ]]; then
    mate-session-save --logout
fi
