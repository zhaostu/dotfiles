#!/bin/sh

# The path containing the scripts.
export TOOLS_PATH=$(dirname $(readlink -f $0))

. $TOOLS_PATH/config.sh
. $TOOLS_PATH/functions.sh

for file in $DOTFILES
do
    backup_and_symlink $INSTALL_PATH/.$file $FILES_PATH/$file $BACKUP_PATH
done

# Initialize all submodules.
cd $BASE_PATH
git submodule update --init

# Install vim bundles through Vundle.
vim +BundleInstall +qall
