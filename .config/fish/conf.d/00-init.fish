# overwrite greeting to disable fastfetch
function fish_greeting
    # do nothing
end

# Load 1Password-backed env vars once per interactive fish shell.
if status is-interactive; and not set -q OP_ENV_LOADED
    if command -q op
	if op signin >/dev/null 2>&1
	    set -gx OP_ENV_LOADED 1
	    exec op run --no-masking --env-file "$HOME/.config/op/environment" -- $SHELL -l
	else
	    set -gx OP_ENV_LOADED 0
	end
    end
end
