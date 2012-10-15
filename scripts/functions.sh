#!/bin/sh

backup_and_symlink(){
    # args: dest, src, backup_folder
    # Backup dest to backup_folder, then create symlink dest -> src

    # Check if backup folder exists.
    if [ ! -d $3 ]; then
        if [ ! -e $3 ]; then
            echo "Backup folder does not exist. Creating a new one."
            mkdir $3
        else
            echo "Error: Backup folder '$3' exists and is not a folder."
            exit 1
        fi
    fi

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

    # Check whether backup_folder exists.
    if [ ! -d $2 ]; then
        echo "Error: Backup folder does not exist."
        exit 1
    fi

    # Unsymlink
    if [ -L $1 ]; then
        echo "Unsymlinking '$1'."
        rm $1
    fi

    # Check whether the file to restore exists
    if [ -e $backup_file ] || [ -L $backup_file ]; then
        echo "Restoring '$1' from backup."
        mv $backup_file $1
    else
        echo "Warning: Cannot find the backup file for '$1'."
    fi
}
