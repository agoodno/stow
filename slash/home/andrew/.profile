# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# path database scripts
if [ -d "$HOME/bin/dbs" ] ; then
    PATH="$HOME/bin/dbs:$PATH"
fi

# set M2_HOME
export M2_HOME=$HOME/opt/maven
if [ -d "$M2_HOME" ] ; then
    PATH="$M2_HOME/bin:$PATH"
fi

export GRADLE_HOME=$HOME/opt/gradle
if [ -d "$GRADLE_HOME/bin" ] ; then
    PATH="$GRADLE_HOME/bin:$PATH"
fi

export HEROKU_HOME=/usr/local/heroku
if [ -d "$HEROKU_HOME/bin" ] ; then
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
    PATH="$HEROKU_HOME/bin:$PATH"
fi

export EDITOR=emacsclient

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
