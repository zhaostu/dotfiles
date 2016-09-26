#!/bin/sh -eu

# The path where the dotfiles should be installed.
INSTALL_PATH=$HOME

# The path of the project.
BASE_PATH=$(readlink -f $SCRIPTS_PATH/..)

# The path containing the pre-configured dotfiles.
FILES_PATH=$BASE_PATH/files

# The path to backup existing dotfiles from the INSTALL_PATH.
BACKUP_PATH=$BASE_PATH/backup

# List of dotfiles to install to the home directory, seperate by space.
DOTFILES='gitconfig gitignore_global vimrc oh-my-zsh zshrc profile i3 Xresources'

# List of files to install to custom position, seperated by newline.
# On each line, put the file and the target filename, seperated by space.
CUSTOM_FILES='zsh-syntax-highlighting .oh-my-zsh/custom/plugins/zsh-syntax-highlighting
virtualenvwrapper .oh-my-zsh/custom/plugins/virtualenvwrapper
stu.zsh-theme .oh-my-zsh/custom/themes/stu.zsh-theme
workrave.ini .workrave/workrave.ini
termite .config/termite'
