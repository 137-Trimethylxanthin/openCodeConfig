# OpenCode workflow map

## Primary workflows

| Primary | Default model | Automatic subagent budget | Intended use |
|---|---|---:|---|
| `build` | `gpt-5.6-terra` `high` | 0 normally; 1 medium; 2 large | Routine coding; direct execution is the default |
| `plan` | `gpt-5.6-sol` `high` | 0 normally; max 2 | Read-only architecture or migration planning |
| `project` | `gpt-5.6-sol` `xhigh` | 3 normally; max 5 | Explicit cross-cutting/high-impact implementation |
| `research` | `gpt-5.6-terra` `high` | 0 normally; max 2 | Current public or internal technical research |
| `browser` | `gpt-5.6-terra` `high` | 0 normally; max 1 | Browser, network, accessibility, and UX verification |
| `security` | `gpt-5.6-sol` `high` | max 3 | Explicit defensive security assessment |
| `ctf` | `gpt-5.6-sol` `xhigh` | max 3 | Authorized CTF/lab work |
| `infra` | `gpt-5.6-sol` `high` | max 2 | Infrastructure and operations |
| `docs` | `gpt-5.6-luna` `high` | 0 normally; max 1 | Verified documentation |

## Core routing rule

`build` handles known, bounded work itself. A bug, behavior change, or risk-domain keyword is not sufficient reason to delegate.

Use `project`, `security`, `ctf`, or `infra` manually when you intentionally want a heavyweight workflow.

## Manual specialist commands

- `/debug` — difficult reproducible failure
- `/architecture` — cross-system architecture or migration design
- `/review` — explicit independent diff review
- `/quality-gate` — deliberate risk-selected reviewer council
- `/test` — distinct test implementation unit
- `/research` — one current external technical question
- `/system-diagnose` — Linux workstation/server diagnosis
- `/opencode-maintain` — OpenCode configuration work

## Optional MCPs

MCPs remain disabled by default. Connect only the server required by the selected workflow. Agent permissions expose Context7/grep.app to research, Playwright to browser, and Semgrep to security/CTF.
