# OpenCode mono configuration

This repository contains an OpenAI-only, mono-config OpenCode setup.

The tracked configuration is `.config/opencode`.

It is designed for native OpenCode CLI and Desktop use without profile overlays, `OPENCODE_CONFIG`, or `oc`/`ocd` wrappers.

## Workflows

Use Tab to select one primary workflow:

- `build` — routine implementation
- `project` — cross-cutting work
- `plan` — read-only planning
- `research` — current technical research
- `browser` — browser and accessibility verification
- `security` — defensive review
- `ctf` — authorized CTF/lab work
- `infra` — infrastructure and operations
- `docs` — verified documentation

After selecting a workflow, use `/scout`, `/plan`, or `/build` to apply an evidence, planning, or implementation phase without losing the selected workflow prompt.

## MCP policy

Context7, grep.app, Playwright, and Semgrep are defined but disabled at startup.

Connect them explicitly only when needed.

## Installation

Back up an existing `~/.config/opencode` directory before installing.

Copy `.config/opencode` to `~/.config/opencode`, keep the target private, and do not copy `node_modules` or local state.

Authenticate with OpenCode, then use `/connect` to select the OpenAI provider.

## Safety

- No LeanCTX integration.
- No automatic sudo, askpass, or password-export plugin.
- Privileged commands, deployments, remote writes, and destructive operations require user approval.
- Review project-level OpenCode configuration before opening untrusted repositories because project config can override global config.

## Validation

Run:

```bash
jq empty .config/opencode/opencode.json .config/opencode/tui.json
opencode debug config
opencode agent list
```

See `.config/opencode/WORKFLOWS.md` for operational details.
