#!/bin/sh

# The path containing the scripts.
export TOOLS_PATH=$(dirname $(readlink -f $0))

. $TOOLS_PATH/config.sh
. $TOOLS_PATH/functions.sh

pre_install

for file in $DOTFILES
do
    install_file $file
done

# Initialize and update all submodules.
cd $BASE_PATH
git submodule update --init
git submodule foreach git pull origin master

post_install
