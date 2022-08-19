unset MAILCHECK

export HISTCONTROL=ignoreboth

# export PS1="\u@\h:\w $ "
export EDITOR=/Applications/Emacs.app/Contents/MacOS/bin-x86_64-10_10/emacsclient
export GIT_EDITOR=$EDITOR
export HOMEBREW_NO_AUTO_UPDATE=1

export PATH="/usr/local/opt/qt@5.5/bin:$HOME/bin:$PATH"
#export PATH="/usr/local/sbin:$PATH"

ssh-add -K

# source ~/.zprofile.extra.sh
