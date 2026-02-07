source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting to disable fastfetch
function fish_greeting
    # do nothing
end

# aliases
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias tf='terraform'
alias k='kubectl'
alias b2='b2v4'

# asdf setup
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

# asdf variables
set -gx ASDF_GOLANG_MOD_VERSION_ENABLED true

# add $HOME/bin to PATH
if test -d "$HOME/bin"
    set -gx --prepend PATH "$HOME/bin"
end