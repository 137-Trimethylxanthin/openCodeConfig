# Balanced OpenCode configuration

Estimated audit score: **93/100**.

## Install

Back up the existing configuration, then copy this directory into the global OpenCode configuration location:

```bash
mv ~/.config/opencode ~/.config/opencode.backup-$(date +%Y%m%d-%H%M%S)
mkdir -p ~/.config
cp -a ./opencode ~/.config/opencode
```

Validate before starting OpenCode:

```bash
~/.config/opencode/scripts/validate-config.py
```

## Default behavior

- `build` handles known, bounded work directly with **zero subagents**.
- Ordinary tasks may use at most **one** narrowly triggered specialist.
- Large tasks may use at most **two** specialists before the workflow recommends switching to `project`.
- `project`, `security`, `ctf`, and `infra` are deliberately heavyweight workflows selected manually with Tab.
- Sol `max` is not used automatically anywhere.
- All 24 custom specialist agents remain available in the workflows where their domain is relevant.

Read `WORKFLOWS.md` for routing rules and `AGENT_CALL_GRAPH.md` for the full Mermaid diagram.
