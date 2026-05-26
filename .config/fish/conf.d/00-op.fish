# Only interactive shells.
status is-interactive; or return

# Escape hatches / recursion guards.
set -q TMUX; and return
set -q NO_OP; and return
set -q OP_INJECTED; and return

# Skip if op is unavailable.
type -q op; or return

# Avoid weird behavior in non-TTY contexts.
isatty stdin; or return
isatty stdout; or return

# Do not start op inside integrated IDEs
if set -q VSCODE_INJECTION; or set -q ZED_TERM
    return
end

set -l OP_ENV "$HOME/.config/op/environment"

# If the env file is missing, do not wrap the shell.
test -r "$OP_ENV"; or return

# Try to authenticate first. If you cancel, this returns non-zero and Fish continues normally.
op signin >/dev/null 2>/dev/null
or begin
    set -gx OP_SKIPPED 1
    return
end

# Auth succeeded. Replace this shell with an OP-injected login fish.
set -gx OP_INJECTED 1
exec op run --no-masking --env-file "$OP_ENV" -- fish -l
