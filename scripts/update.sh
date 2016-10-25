#!/bin/sh -eu

# The path containing the scripts.
export SCRIPTS_PATH=$(dirname $(readlink -f $0))

# Make sure the installation folder is clean
GIT_STATUS_FLAG='--porcelain --ignore-submodules --untracked-files=no'
GIT_DIRTY=$(cd $SCRIPTS_PATH; git status $GIT_STATUS_FLAG 2> /dev/null | tail -n1)

# Uninstall the old version.
$SCRIPTS_PATH/uninstall.sh

cd $SCRIPTS_PATH

# Make sure the name and email is set
git config user.name "Stu Zhao"
git config user.email "z12y12l12@gmail.com"

# Update the project itself.
git pull --rebase --autostash origin master

# Install the new version.
$SCRIPTS_PATH/install.sh
