unset MAILCHECK

export HISTCONTROL=ignoreboth

export PS1="\u@\h:\w $ "
export EDITOR=/Applications/Emacs.app/Contents/MacOS/bin-x86_64-10_10/emacsclient
export GIT_EDITOR=$EDITOR

export PATH="$PATH:$HOME/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/andy/.sdkman"
[[ -s "/Users/andy/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/andy/.sdkman/bin/sdkman-init.sh"
