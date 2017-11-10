#!/bin/sh -eu

# The path containing the scripts.
export SCRIPTS_PATH=$(dirname $(readlink -f $0))

. $SCRIPTS_PATH/config.sh
. $SCRIPTS_PATH/functions.sh

pre_install

for file in $DOTFILES
do
    install_file $file
done

# Initialize and update all submodules.
cd $BASE_PATH
git submodule update --init > /dev/null 2>&1
git submodule foreach 'git checkout master && git pull' > /dev/null 2>&1

# Download lfs tracked files
git lfs pull || true

i=0
for file in $CUSTOM_FILES
do
    if [ $i -eq 0 ]; then
        filename=$file
    else
        target_file=$file
        install_custom_file $filename $target_file
    fi
    i=$(( ($i+1)%2 ))
done

post_install
