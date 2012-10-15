#!/bin/sh

# Check whether git exists.
git --version &> /dev/null || {
     echo 'Git is not installed on this system.'
     exit 1
}

echo 'Cloning dotfiles to ~/.dotfiles'
git clone https://github.com/zhaostu/dotfiles.git ~/.dotfiles

echo 'Installing dotfiles.'
~/.dotfiles/scripts/install.sh

echo 'Finished!'
