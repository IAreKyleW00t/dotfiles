if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

# Go env
source (echo $ASDF_DATA_DIR | if test -z $it; echo $HOME/.asdf; else echo $it; end)/plugins/golang/set-env.fish
