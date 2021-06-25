#!/usr/bin/env bash

#only run on arch based linux

#setup

FOLDERLIST="
    .config/bspwm
    .config/kitty
    .config/mutt
    .config/nvim
    .config/polybar
    .config/qutebrowser
    .config/ranger
    .config/rofi
    .config/dunst
    .config/sxhkd
    .config/zathura
    .zshrc.d
"

DOTFILES_DIR="$( pwd )"

DIRECTLINKS="
    .bashrc
    .gitconfig
    .pinerc
    .Xdefaults
    .zprofile
    .zshrc
    .oh-my-zshrc
    .oh-my-zsh/themes/bgnoster.zsh-theme
    .tmux.conf
"

DEPLIST="
    alacritty
    brave
    bspwm
    clamav
    evince
    fd
    fzf
    inotify-tools
    mpv
    neovim
    ttf-fira-code
    picom
    python-pip
    qrencode
    ripgrep
    rsync
    sound-theme-elementary
    texlive-core
    texlive-fontsextra
    texlive-langextra
    texlive-latexextra
    texlive-science
    texlive-ieeetran
    tmux
    trash-cli
    ttf-droid
    zathura
    zathura-pdf-poppler
    zsh
"

# installing dependencies

echo -e "\\e[1;32m=> NOW INSTALLING PACKAGES\\e[0m"
sudo pacman --noconfirm -S $DEPLIST

# Linking

echo -e "\n\\e[1;32m=> NOW LINKING FOLDERS\\e[0m"
for d in $FOLDERLIST; do
    if [[ ! ( -h "$HOME/$d" ) ]];
    then
        ln -svi "$DOTFILES_DIR/$d" $HOME/$(dirname $d);
    fi
done

echo -e "\n\\e[1;32m=> NOW LINKING FILES\\e[0m"
for file in $DIRECTLINKS; do
    if [[ ! ( -h "$HOME/$file" ) ]];
    then
        ln -svi "$DOTFILES_DIR/$file" "$HOME/$(dirname $file)";
    fi
done
