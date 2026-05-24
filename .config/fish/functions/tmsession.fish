function tmsession --description "Jump to a tmux session by name or partial name"
    if not command -q tmux
        echo "tmux is not installed"
        return 1
    end

    set -l sessions (tmux list-sessions -F '#S' 2>/dev/null)

    if test (count $sessions) -eq 0
        echo "No tmux sessions found"
        return 1
    end

    set -l target

    # No argument: interactively select a session.
    if test (count $argv) -eq 0
        if command -q fzf
            set target (
                printf "%s\n" $sessions |
                fzf \
                    --prompt="tmux session> " \
                    --height=40% \
                    --reverse \
                    --preview='tmux list-windows -t {} -F "#{window_index}: #{window_name} #{?window_active,[active],}"'
            )
        else
            echo "Select a tmux session:"
            for i in (seq (count $sessions))
                echo "  $i) $sessions[$i]"
            end

            read --prompt-str="session> " choice

            if string match -qr '^[0-9]+$' -- "$choice"
                and test "$choice" -ge 1
                and test "$choice" -le (count $sessions)
                set target "$sessions[$choice]"
            else
                echo "Invalid selection"
                return 1
            end
        end

    # Argument provided: exact/partial match.
    else
        set -l query $argv[1]

        # Exact match first.
        for s in $sessions
            if test "$s" = "$query"
                set target "$s"
                break
            end
        end

        # Then substring match.
        if test -z "$target"
            set -l matches

            for s in $sessions
                if string match -q "*$query*" "$s"
                    set -a matches "$s"
                end
            end

            if test (count $matches) -eq 1
                set target "$matches[1]"
            else if test (count $matches) -gt 1
                echo "Multiple matches:"
                printf "  %s\n" $matches
                return 1
            end
        end
    end

    if test -z "$target"
        echo "No session selected"
        return 1
    end

    if set -q TMUX
        tmux switch-client -t "$target"
    else
        tmux attach-session -t "$target"
    end
end
