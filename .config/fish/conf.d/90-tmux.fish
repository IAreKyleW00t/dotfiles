# Auto-enter tmux for local interactive terminals.
#
# Normal terminals attach/create: main
# VS Code integrated terminals attach/create: vscode-<folder>-<hash>

# Only run for interactive shells.
if not status is-interactive
    return
end

# Allow one-off bypass:
#   env NO_TMUX=1 fish
if set -q NO_TMUX
    return
end

# Do not start tmux inside tmux.
if set -q TMUX
    return
end

# Do not auto-tmux over SSH.
if set -q SSH_TTY
    return
end

# Do not interfere with VS Code's hidden shell used to resolve environment.
if test "$VSCODE_RESOLVING_ENVIRONMENT" = "1"
    return
end

# Do nothing if tmux is unavailable.
if not command -q tmux
    return
end

# VS Code integrated terminal gets a workspace/repo-specific session.
if test "$TERM_PROGRAM" = "vscode"
    set -l root "$PWD"

    # Prefer the git repo root so nested folders share one VS Code tmux session.
    if command -q git
        set -l git_root (command git rev-parse --show-toplevel 2>/dev/null)

        if test -n "$git_root"
            set root "$git_root"
        end
    end

    # Make a safe session name from the folder name.
    set -l folder (basename "$root")
    set -l safe_folder (string replace -ra '[^A-Za-z0-9_.-]' '-' "$folder")

    # Add a short hash so two repos/folders with the same basename do not collide.
    set -l hash (printf "%s" "$root" | sha1sum | string split -f1 ' ' | string sub -l 8)

    set -l session "vscode-$safe_folder-$hash"

    exec tmux new-session -A -s "$session" -c "$root"
    return
end

# Normal local terminal gets the main session.
exec tmux new-session -A -s main -c "$PWD"
