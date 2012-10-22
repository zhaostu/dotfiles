#!/bin/sh

# The path containing the scripts.
export TOOLS_PATH=$(dirname $(readlink -f $0))

. $TOOLS_PATH/config.sh
. $TOOLS_PATH/functions.sh

# Update all submodules
cd $BASE_PATH
git submodule foreach git pull origin master

# Update vim bundles through Vundle.
vim +BundleInstall! +qall
