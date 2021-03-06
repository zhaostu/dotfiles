#!/bin/sh

install_file(){
    # args: filename
    # Backup target_file, then create symlink target_file -> source_file.
    filename=$1

    source_file=$FILES_PATH/$filename
    target_file=$INSTALL_PATH/.$filename
    backup_file=$BACKUP_PATH/$filename

    # Backup
    if [ -e $target_file ]; then
        echo "Backing up '$target_file' to '$backup_file'."
        mv $target_file $backup_file
    fi

    # Create symlink of target_file -> source_file
    echo "Creating symlink for '$target_file'."
    ln -s $source_file $target_file
}

uninstall_file(){
    # args: filename
    # Remove symlink target_file -> source_file, then restore target_file.
    filename=$1

    target_file=$INSTALL_PATH/.$filename
    backup_file=$BACKUP_PATH/$filename

    # Remove symlink from target_file
    if [ -L $target_file ]; then
        echo "Removing installed symlink '$target_file'."
        unlink $target_file
    fi

    # Restore
    if [ -e $backup_file ]; then
        echo "Restoring '$target_file' from backup."
        mv $backup_file $target_file
    fi
}

install_custom_file(){
    # args: filename, target_file
    # Create symlink target_file -> filename.

    filename=$1
    target_file=$INSTALL_PATH/$2

    source_file=$FILES_PATH/$filename

    # Create symlink of target_file -> source_file
    echo "Creating symlink for '$target_file'."
    mkdir -p $(dirname $target_file)
    ln -s $source_file $target_file
}

uninstall_custom_file(){
    # args: target_file
    # Remove symlink target_file -> source_file.
    target_file=$INSTALL_PATH/$1

    # Remove symlink from target_file
    if [ -L $target_file ]; then
        echo "Removing installed symlink '$target_file'."
        unlink $target_file
    fi
}

pre_install(){
    # Create the backup folder.
    mkdir -p $BACKUP_PATH
}

post_install(){
    # Create Vim's undo directory
    mkdir -p $HOME/.vim/undo
    # Get the vim-plug plugin
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # Install/update/clean vim plugins via vim-plug
    vim +PlugUpdate +PlugClean! +qall < /dev/tty
}
