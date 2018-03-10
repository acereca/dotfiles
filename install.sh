#!/usr/bin/env bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DIRECTLINKS="
    .bashrc 
    .gitconfig 
    .pinerc
    .vimrc
    .Xdefaults
    .zprofile
    .zshrc
"

for file in $DIRECTLINKS; do
    ln -sfvi "$DOTFILES_DIR/$file" ~
done

# create symlinks
ln -sfv "$DOTFILES_DIR/.ssh/config"    ~/.ssh/
ln -sfv "$DOTFILES_DIR/.vim/autoload"  ~/.vim/
ln -sfv "$DOTFILES_DIR/.vim/ftplugin"  ~/.vim/
ln -sfv "$DOTFILES_DIR/.config/rofi"   ~/.config/
ln -sfv "$DOTFILES_DIR/.config/ranger" ~/.config/
ln -sfv "$DOTFILES_DIR/.config/i3"     ~/.config/

