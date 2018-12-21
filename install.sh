#!/usr/bin/env bash

# only run on arch based linux

#setup

FOLDERLIST="
    .vim/autoload
    .vim/ftplugin
    .vim/after
    .config/rofi
    .config/ranger
    .config/i3
    .config/kitty
"

DOTFILES_DIR="$( pwd )"

DIRECTLINKS="
    .bashrc 
    .gitconfig 
    .pinerc
    .vimrc
    .Xdefaults
    .zprofile
    .zshrc
    .oh-my-zshrc
    .oh-my-zsh/themes/bgnoster.zsh-theme
"

DEPLIST="
    chromium
    clamav
    code
    compton
    evince
    firefox
    i3-wm
    inotify-tools
    kitty
    mpv
    neovim
    otf-fira-code
    otf-fontawesome
    pacaur
    python-pip
    qrencode
    ranger
    rsync
    texlive-core
    texlive-fontsextra
    texlive-langextra
    texlive-latexextra
    texlive-science
    thunderbird
    tmux
    trash-cli
    ttf-droid
    vim
    zsh
"

# installing dependencies

for dep in $DEPLIST; do
    echo "";
done

# Linking

echo -e "\\e[1;32m=> NOW LINKING FOLDERS\\e[0m"
for d in $FOLDERLIST; do
    ln -sfvi "$DOTFILES_DIR/$d" $HOME/$(dirname $d);
done

echo -e "\n\\e[1;32m=> NOW LINKING FILES\\e[0m"
for file in $DIRECTLINKS; do
    ln -sfvi "$DOTFILES_DIR/$file" "$HOME/$(dirname $file)";
done
