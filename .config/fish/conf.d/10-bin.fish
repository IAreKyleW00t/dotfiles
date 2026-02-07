# add $HOME/bin to PATH
if test -d "$HOME/bin"
    set -gx --prepend PATH "$HOME/bin"
end
