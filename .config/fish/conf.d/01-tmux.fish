# Auto-enter tmux for local interactive terminals.

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

# Do not start tmux inside integrated IDEs
if test "$TERM_PROGRAM" = "vscode"; or test "$ZED_TERM" = "true"
    return
end

# Normal local terminal gets the main session.
exec tmux new-session -A -s main -c "$PWD"
