# Configuration audit

## Estimated score: 93/100

- Routing discipline: 19/20
- Model allocation and cost control: 18/20
- Agent scoping: 19/20
- Permissions and safety: 19/20
- Context and maintainability: 18/20

## Material changes

- Default `build` now uses zero subagents for known, bounded work.
- Ordinary tasks can use at most one specialist; large tasks can use at most two before switching to `project`.
- Sol `max` was removed from all automatic workflow paths.
- Debugging, review, testing, design, performance, skepticism, and infrastructure review moved to Terra where appropriate.
- Sol is reserved for architecture, security, incidents, reverse engineering, and explicitly selected heavyweight workflows.
- Agent descriptions now include negative triggers to prevent semantic over-routing.
- The global 200-token response cap and forced abbreviation style were removed.
- Connected provider visibility is restored by removing the `enabled_providers` allowlist.
- Duplicate `AGENTS.md` injection was removed.
- Lean CTX is optional rather than assumed.
- Unused Node plugin dependencies and vendored `node_modules` were removed.
- Exact routing documentation and a Mermaid call graph were added.

## Remaining limitations

- Prompt budgets are policy constraints, not a native numeric OpenCode child-count limit.
- Final behavior still depends on the selected model following routing instructions.
- Live validation requires running the installed OpenCode version against representative prompts.
