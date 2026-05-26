# Auto-enter tmux for local interactive terminals.

# Only run for interactive shells.
if not status is-interactive
    return
end

# Avoid weird behavior in non-TTY contexts.
isatty stdin; or return
isatty stdout; or return

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

# Do not start tmux inside integrated IDEs
if set -q VSCODE_INJECTION; or set -q ZED_TERM
    return
end

# Do nothing if tmux is unavailable.
if not command -q tmux
    return
end

# Normal local terminal gets the main session.
exec tmux new-session -A -s main -c "$PWD"
