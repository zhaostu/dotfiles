#!/bin/sh

# The path containing the scripts.
export TOOLS_PATH=$(dirname $(readlink -f $0))

. $TOOLS_PATH/config.sh
. $TOOLS_PATH/functions.sh

for file in $DOTFILES
do
    unsymlink_and_restore $INSTALL_PATH/.$file $BACKUP_PATH
done
