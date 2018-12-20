dot files
========

Machine config files managed by GNU Stow.

# Setup

Checkout the project to the root of the home directory. Stow
automatically assumes the target destination of the files to be the
parent directory so this is the easiest setup.

    cd $HOME
    git clone git@github.com:agoodno/stow.git

Issue commands from within:

    $HOME/stow


# Install a stow package

    stow -vv abcde

    stow -vv mint-bash

    stow -vv macos-bash
