# Stu's Dotfiles
This is my personal dotfiles. Feel free to take a look inside.

## Requirements
 * `git`
 * `vim`
 * `zsh`

### Optional requirements
 * `silversearcher-ag` or `ack-grep` code searching like grep

#### Python
 * `flake8` Python syntax and style checker
 * `virtualenvwrapper` wrapper for Python virtualenv

#### i3
 * `i3` tile window manager

## Install
Installing these dotfiles are easy, simply execute this command
in your shell:

    wget http://goo.gl/tYPTH -O - | sh
or

    curl http://goo.gl/tYPTH | sh

To change the login shell to `zsh`, execute the following command:

    sudo chsh -s $(which zsh) [username]
