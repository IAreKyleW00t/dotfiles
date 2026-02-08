# Utility function to update yay
function yay-update
    set -q YAY_REPO || set YAY_REPO "yay-bin" # or yay
    set -q YAY_SRC_DIR || set YAY_SRC_DIR "$HOME/.local/src/$YAY_REPO"
    mkdir -p "$YAY_SRC_DIR"
    if not test -d "$YAY_SRC_DIR/.git"
        git clone "https://aur.archlinux.org/$YAY_REPO.git" "$YAY_SRC_DIR"
    end
    fish -c "cd '$YAY_SRC_DIR' && git pull && makepkg -si"
end
