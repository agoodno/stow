echo 'executing .bash_profile'
if [ -f "$HOME/.bashrc" ]; then
  echo 'sourcing .bashrc'
  source "$HOME/.bashrc"
fi
#export PATH="/usr/local/opt/gettext/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
