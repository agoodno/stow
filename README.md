dotfiles
========

Machine config files managed by GNU Stow.

Installed with:

stow -vv abcde -t $HOME

stow -vv mint-bash -t $HOME

The target flag is necessary because without it, stow assumes the
dotfiles directory is at the root of $HOME and sets the target to
one-level up by default which has no effect.
