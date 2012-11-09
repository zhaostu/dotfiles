#!/bin/sh

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
git submodule update --init
git submodule foreach git checkout master
git submodule foreach git pull

post_install
