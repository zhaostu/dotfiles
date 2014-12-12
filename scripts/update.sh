#!/bin/sh

# Exit if command fails or variable not set.
set -e
set -u

# The path containing the scripts.
export SCRIPTS_PATH=$(dirname $(readlink -f $0))

# Uninstall the old version.
$SCRIPTS_PATH/uninstall.sh

# Update the project itself.
cd $SCRIPTS_PATH

# The reason to config user email / name is so that `git stash` would work.
git config user.email "z12y12l12@gmail.com"
git config user.name "Stu Zhao"
git stash save -q && :
git pull origin master

# Install the new version.
$SCRIPTS_PATH/install.sh
