#!/bin/sh -eu

# The path containing the scripts.
export SCRIPTS_PATH=$(dirname $(readlink -f $0))

# Make sure the installation folder is clean
GIT_STATUS_FLAG='--porcelain --ignore-submodules --untracked-files=no'
GIT_DIRTY=$(cd $SCRIPTS_PATH; git status $GIT_STATUS_FLAG 2> /dev/null | tail -n1)

# Uninstall the old version.
$SCRIPTS_PATH/uninstall.sh

# Update the project itself.
cd $SCRIPTS_PATH

git pull --rebase --autostash origin master

# Install the new version.
$SCRIPTS_PATH/install.sh
