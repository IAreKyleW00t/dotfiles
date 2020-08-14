# This file is needed as a workaround for
# gnome-terminal using bash by default
if test -t 1; then
  exec $(which zsh) "$@"
fi
