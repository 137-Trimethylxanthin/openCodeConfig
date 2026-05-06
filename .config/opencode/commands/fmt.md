---
description: Format all code in the project
agent: build
---

Run all available formatters for this project:
- Python: `ruff format .`
- Rust: `cargo fmt`
- TypeScript/JS: use the project's formatter (biome/prettier)
- Go: `gofmt -w .`
- CSS/HTML/Svelte/Astro: use the project's formatter

Apply formatting to all files in the project. Report what was changed.
