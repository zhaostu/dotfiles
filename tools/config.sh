#!/bin/sh

# The path where the dotfiles should be installed.
INSTALL_PATH=~
# The path containing the pre-configured dotfiles.
BASE_PATH=$(readlink -f $TOOLS_PATH/..)
# The path to backup existing dotfiles from the INSTALL_PATH.
BACKUP_PATH=$BASE_PATH/backup

# List of dotfiles to install, seperate by space.
DOTFILES=gitconfig

