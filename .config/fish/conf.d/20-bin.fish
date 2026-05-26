# add $HOME/bin to PATH
if test -d ~/.local/bin; and not contains ~/.local/bin $PATH
    set -gx --prepend PATH ~/.local/bin
end

# add dotnet tools
if test -d ~/.dotnet/tools; and not contains ~/.dotnet/tools $PATH
    set -gx --prepend PATH ~/.dotnet/tools
end
