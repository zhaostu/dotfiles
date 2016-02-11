#!/bin/sh -eu

# The path containing the scripts.
export SCRIPTS_PATH=$(dirname $(readlink -f $0))

. $SCRIPTS_PATH/config.sh
. $SCRIPTS_PATH/functions.sh

i=0
for file in $CUSTOM_FILES
do
    if [ $i -ne 0 ]; then
        target_file=$file
        uninstall_custom_file $target_file
    fi
    i=$(( ($i+1)%2 ))
done

for file in $DOTFILES
do
    uninstall_file $file
done
