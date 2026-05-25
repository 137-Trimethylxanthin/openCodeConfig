#!/usr/bin/env fish
# ───────────────────────────────────────────────────
# OpenCode launcher — sources .env then starts opencode
# Usage: ./opencode.fish [opencode args...]
# ───────────────────────────────────────────────────

set -l script_dir (dirname (realpath (status --current-filename)))
set -l env_file "$script_dir/.env"

if test -f "$env_file"
    for line in (cat "$env_file" | string trim)
        # Skip comments and empty lines
        if string match -qr '^\s*(#|$)' -- "$line"
            continue
        end
        # Parse KEY=VALUE (handle values with = signs)
        set -l parts (string split -m1 "=" -- "$line")
        set -l key (string trim -- $parts[1])
        set -l value ""
        if test (count $parts) -gt 1
            set value (string trim -- $parts[2])
        end
        # Only export if key is valid and not empty
        if test -n "$key"
            set -gx $key $value
        end
    end
    echo "[oc] loaded $env_file"
else
    echo "[oc] WARNING: $env_file not found" >&2
end

exec opencode $argv
