#!/bin/sh

backup_and_symlink(){
    # args: dest, src, backup_folder
    # Backup dest to backup_folder, then create symlink dest -> src

    # Backup the dest to backup_folder
    if [ -e $1 ]; then
        echo "Backing up '$1' to the backup folder."
        mv $1 $3
    fi
    # Create symlink dest -> src.
    echo "Creating symlink for '$1'."
    ln -s $2 $1
}

unsymlink_and_restore(){
    # args: dest, backup_folder
    # Remove symlink at dest, then restore dest from backup folder.

    backup_file=$2/`basename $1`

    # Unsymlink
    if [ -L $1 ]; then
        echo "Unsymlinking '$1'."
        rm $1
    fi

    # Check whether the file to restore exists
    if [ -e $backup_file ] || [ -L $backup_file ]; then
        echo "Restoring '$1' from backup."
        mv $backup_file $1
    fi
}

pre_install(){
    # Create the backup folder.
    mkdir -p $BACKUP_PATH
}

post_install(){
    # Install/update/clean vim bundles through Vundle.
    vim +BundleInstall! +BundleClean +qall

    # Build command-t
    cd $FILES_PATH/vim/bundle/command-t/ruby/command-t
    ruby extconf.rb
    make
}
