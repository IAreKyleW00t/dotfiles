# add $HOME/bin to PATH
if test -d "$HOME/bin"
    set -gx --prepend PATH "$HOME/bin"
end

# add dotnet tools
if test -d "$HOME/.dotnet/tools"
    set -gx --prepend PATH "$HOME/.dotnet/tools"
end
