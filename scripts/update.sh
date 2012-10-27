#!/bin/sh

# The path containing the scripts.
export SCRIPTS_PATH=$(dirname $(readlink -f $0))

# Uninstall the old version.
$SCRIPTS_PATH/uninstall.sh

# Update the project itself.
cd $SCRIPTS_PATH
git pull origin master

# Install the new version.
$SCRIPTS_PATH/install.sh
