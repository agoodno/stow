echo 'executing .bashrc'

#Addition of /usr/local/bin only needed by emacs (duplicates
#/usr/local/bin path in terminal because terminal also picks it up
#from /etc/paths but can live with this).
export PATH="$HOME/local/sbin:$HOME/local/bin:/usr/local/sbin:/usr/local/bin:$PATH"
export PS1="\u@\h:\w $ "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
#export AWS_DEFAULT_REGION=us-east-1
#export AWS_REGION=us-east-1
#export AWS_ACCESS_KEY_ID=XXX
#export AWS_SECRET_ACCESS_KEY=XXX
#export ALTERNATE_EDITOR=""
export EDITOR=/Applications/Emacs.app/Contents/MacOS/bin/emacsclient
export GIT_EDITOR=$EDITOR

# source /usr/local/opt/chruby/share/chruby/chruby.sh
# source /usr/local/opt/chruby/share/chruby/auto.sh

# Java setup
## download from http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
## double-click to install .dmg
## verify
### ls /Library/Java/JavaVirtualMachines/
### echo $JAVA_HOME; java -version
### setjdk 1.8.0_141 (new one)
### echo $JAVA_HOME; java -version

# from https://blog.jayway.com/2014/01/15/how-to-switch-jdk-version-on-mac-os-x-maverick/
function setjdk() {
  if [ $# -ne 0 ]; then
    removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
    if [ -n "${JAVA_HOME+x}" ]; then
      removeFromPath $JAVA_HOME
    fi
    export JAVA_HOME=`/usr/libexec/java_home -v $@`
    export PATH=$JAVA_HOME/bin:$PATH
  fi
}

function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}

#setjdk 1.7
#setjdk 1.8.0_112
#setjdk 1.8.0_141
setjdk 1.8
