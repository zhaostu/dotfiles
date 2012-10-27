#!/bin/sh

# The path containing the scripts.
export TOOLS_PATH=$(dirname $(readlink -f $0))

# Uninstall the old version.
$TOOLS_PATH/uninstall.sh

# Update the project itself.
cd $BASE_PATH
git pull origin master

# Install the new version.
$TOOLS_PATH/install.sh
