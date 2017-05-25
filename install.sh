#!/usr/bin/env bash

# collect pwd
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# check for and update or install dependencies
sudo pacman -S - < pacman.pkglist
sudo pip install -r pip.pkglist


if [ ! -n "$(pacman -Qs cower)" ]; then
    curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower
    makepkg PKGBUILD --skippgpcheck
    sudo pacman -U cower*.tar.xz --noconfirm
fi

# Install "pacaur" from AUR
if [ ! -n "$(pacman -Qs pacaur)" ]; then
    curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur
    makepkg PKGBUILD
    sudo pacman -U pacaur*.tar.xz --noconfirm
fi
pacaur -S - < aur.pkglist


# create symlinks
ln -sfv "$DOTFILES_DIR/.bashrc" ~
ln -sfv "$DOTFILES_DIR/.gitvonfig" ~
ln -sfv "$DOTFILES_DIR/.livestreamerrc" ~
ln -sfv "$DOTFILES_DIR/.streamlinkrc" ~
ln -sfv "$DOTFILES_DIR/.vimrc" ~
ln -sfv "$DOTFILES_DIR/.Xdefaults" ~
ln -sfv "$DOTFILES_DIR/.zshrc" ~
ln -sfv "$DOTFILES_DIR/ssh/config" ~/.ssh/
ln -sfv "$DOTFILES_DIR/i3/config" ~/.config/i3/
ln -sfv "$DOTFILES_DIR/i3/i3blocks.conf" ~/.config/i3/
