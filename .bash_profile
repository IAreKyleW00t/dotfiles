# This file is needed as a workaround for
# gnome-terminal using bash by default
if test -t 1; then
  exec $(which zsh) "$@"
fi

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
