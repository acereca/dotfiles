#!/usr/bin/env bash

# collect pwd
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# get os name
if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
    # linuxbase.org
    OS=$(lsb_release -si)
    VER=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
    # For some versions of Debian/Ubuntu without lsb_release command
    . /etc/lsb-release
    OS=$DISTRIB_ID
    VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
    # Older Debian/Ubuntu/etc.
    OS=Debian
    VER=$(cat /etc/debian_version)
else
    # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
    OS=$(uname -s)
    VER=$(uname -r)
fi

# only perform this on Manjaro / Arch distros
echo -e $OS
case $OS in
    
    "Manjaro Linux")
        sudo pip install -r pip.pkglist
        sudo pacman -S - < pacman.pkglist

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
        
        rm -r "$DOTFILES_DIR/src/"
        rm -r "$DOTFILES_DIR/pkg/"
        rm "$DOTFILES_DIR/PKGBUILD"

        pacaur -S - < "$DOTFILES_DIR/aur.pkglist"
    ;;
esac

# create symlinks
ln -sfvi "$DOTFILES_DIR/.bashrc" ~
ln -sfvi "$DOTFILES_DIR/.gitvonfig" ~
ln -sfvi "$DOTFILES_DIR/.livestreamerrc" ~
ln -sfvi "$DOTFILES_DIR/.streamlinkrc" ~
ln -sfvi "$DOTFILES_DIR/.vimrc" ~
ln -sfvi "$DOTFILES_DIR/.Xdefaults" ~
ln -sfvi "$DOTFILES_DIR/.zshrc" ~
ln -sfvi "$DOTFILES_DIR/.zprofile" ~
ln -sfvi "$DOTFILES_DIR/ssh/config" ~/.ssh/
ln -sfvi "$DOTFILES_DIR/i3" ~/.config/
ln -sfvi "$DOTFILES_DIR/ranger" ~/.config/
ln -sfvi "$DOTFILES_DIR/.rofirc" ~/.config/rofi/config
ln -sfvi "$DOTFILES_DIR/.pinerc" ~/.pinerc
