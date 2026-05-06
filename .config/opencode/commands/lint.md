---
description: Run linters and fix all issues
agent: build
---

Run all available linters for this project and fix every issue:
- Python: `ruff check .`
- Rust: `cargo clippy -- -D warnings`
- TypeScript/JS: check package.json for lint command (eslint, biome, oxlint)
- Go: `go vet ./...`
- Svelte: `svelte-check`
- Astro: `astro check`

After fixing issues, re-run linters to confirm everything passes.
