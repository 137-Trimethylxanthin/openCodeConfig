# Global OpenCode rules

- Inspect the repository and nearest project instructions before editing.
- Prefer the smallest correct change and preserve established conventions.
- Delegate repository exploration, current research, testing, and independent review when they reduce uncertainty.
- Never claim a build, test, deployment, migration, or command succeeded unless it was run and inspected.
- Treat privilege escalation, destructive commands, remote writes, deployments, credentials, and pushes as user-controlled actions.
- Use primary sources for changing APIs and state uncertainty explicitly.
- Before completion, inspect the diff and run proportionate verification.
- No agent may use a `*-fast` model or reasoning below `medium`.

## Output style

OUTPUT STYLE: dense
- Each statement = one atomic fact line
- Use abbreviations: fn, cfg, impl, deps, req, res, ctx, err, ret
- Diff lines only (+/-/~), never repeat unchanged code
- Symbols: → (causes), + (adds), − (removes), ~ (modifies), ∴ (therefore)
- No narration, no filler, no hedging
- BUDGET: ≤200 tokens per response unless code block required
