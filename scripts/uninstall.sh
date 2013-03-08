#!/bin/sh

# Exit if command fails or variable not set.
set -e
set -u

# The path containing the scripts.
export SCRIPTS_PATH=$(dirname $(readlink -f $0))

. $SCRIPTS_PATH/config.sh
. $SCRIPTS_PATH/functions.sh

for file in $DOTFILES
do
    uninstall_file $file
done
