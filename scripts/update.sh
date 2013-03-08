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
git stash save -q && :
git pull origin master
git stash pop -q && :

# Install the new version.
$SCRIPTS_PATH/install.sh
