# Stu's Dotfiles
This is my personal dotfiles. Feel free to take a look inside. It is meant to
be used in latest Ubuntu or Arch Linux. In practice it is most often used
with my [Arch Linux setup scripts](https://github.com/zhaostu/archup).

## Requirements
 * `git`
 * `vim`
 * `zsh`

### Optional requirements
 * `the_silver_searcher` or `ack` code searching like grep

#### Python
 * `virtualenvwrapper` wrapper for Python virtualenv
 * `flake8` Python syntax and style checker

#### i3
 * `i3-wm` tile window manager
 * `ttf-inconsolata` monospace font
 * `noto-fonts` GUI font
 * `imagemagick` for generating image for lock screen
 * `feh` for setting desktop image
 * `xorg-xrandr` monitor control
 * `xorg-xbacklight` change screen brightness
 * `xautolock` for automatically locking screen
 * `git-lfs` for getting i3 wallpapers
 * `dunst` notification daemon
 * `rofi` window switcher

#### Workrave
 * `workrave` assist taking regular breaks

#### Termite
 * `termite` a keyboard-centric VTE-based terminal

## Install
Installing these dotfiles are easy, simply execute this command
in your shell:

    wget http://goo.gl/tYPTH -O - | sh
or

    curl -L http://goo.gl/tYPTH | sh

To change the login shell to `zsh`, execute the following command:

    sudo chsh -s $(which zsh) [username]

## Update
Execute the following command in the shell:

    dotfiles-update
