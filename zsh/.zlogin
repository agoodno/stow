source "$HOME/.bashrc"

export EDITOR=emacsclient

# SDKMAN!
[[ -s "/Users/andrew/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/andrew/.sdkman/bin/sdkman-init.sh"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
