# OpenCode workflow map

This installation uses one global `opencode.json`; do not use `OPENCODE_CONFIG`, profile overlays, `oc`, or `ocd`.

## Select a workflow

Use Tab to select one primary agent:

- `build` — routine coding and orchestration
- `project` — cross-cutting, high-impact implementation
- `plan` — read-only architecture and migration planning
- `research` — current API and technical research
- `browser` — browser and accessibility verification
- `security` — defensive security review
- `ctf` — authorized CTF/lab work only
- `infra` — infrastructure and operations
- `docs` — verified documentation

## Apply a phase without losing the specialist

After selecting a primary agent, use the generic commands:

```text
/scout inspect this log
/plan design this migration
/build implement this change
```

These commands run in the selected primary workflow and preserve its domain prompt. They are workflow instructions, not permission changes. Use the `plan`, `research`, `browser`, or `security` primary agents when a hard read-only boundary is required.

OpenCode does not compose slash commands. Select `ctf` with Tab, then run `/scout scan this log`; do not write `/ctf /scout ...`.

## Optional MCPs

All MCPs start disabled to avoid unnecessary processes, network access, tool context, and inherited environment exposure.

- Context7 and grep.app: research and docs
- Playwright: browser
- Semgrep: security and ctf

Connect an MCP explicitly through the OpenCode interface before use. Agent permissions expose each MCP only to its owning workflows. A slash command cannot safely or natively enable an MCP automatically.

Project-level `opencode.json` and `.opencode/` configuration remains enabled and has higher precedence than this global configuration. Inspect untrusted project configuration before opening it.

## Rollback

The pre-migration archive is `~/.local/state/opencode/mono-migration-20260717-162001`.
