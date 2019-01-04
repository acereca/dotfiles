#! /usr/bin/zsh

# pwdgen
aes() {
    echo -n $1 | openssl enc -e -aes-256-cbc -a -salt
}
autoload aes