# Codex Global Rules

These rules apply across all projects. Project-specific AGENTS.md files override these.

## General Conduct
- Be concise. Minimize output tokens. No preamble or postamble unless asked.
- Never add comments to code unless explicitly asked.
- Follow existing code conventions of the project being worked on.
- Never assume a library is available — always check package.json/go.mod/Cargo.toml first.
- Never commit changes unless explicitly asked.
- Never create documentation files (*.md) unless explicitly requested.
- After making changes, always run the project's test suite.
- If lint commands exist, run them after changes.

## Multi-Language Standards

### Python
- Use `uv` for package management and `ruff` for linting/formatting.
- Follow PEP 8 style guide. Use type hints everywhere.
- Tests use `pytest`. Run with `uv run pytest`.
- Prefer `pathlib` over `os.path`. Prefer `subprocess.run` over `os.system`.
- Type check: `uv run mypy .`

### Rust
- Use `cargo fmt` for formatting and `cargo clippy` for linting.
- Fail on clippy warnings: `-D warnings` in Cargo.toml or CI.
- Tests: `cargo test`. Run clippy before committing: `cargo clippy -- -D warnings`.
- Type check: `cargo check`

### TypeScript / JavaScript
- Prefer `bun` as the package manager/runtime unless the project uses npm/yarn/pnpm.
- Use strict TypeScript (`strict: true` in tsconfig.json).
- Avoid `any` type. Prefer interfaces over types for object shapes.
- Lint/fmt: use what the project uses (eslint/biome/oxlint + prettier/biome).
- Type check: `tsc --noEmit`

### Astro
- Follow Astro conventions: components in `src/components/`, layouts in `src/layouts/`.
- Use `.astro` files for templates, `.ts` for logic.
- Type check: `astro check`

### Svelte
- Use Svelte 5 runes syntax ($state, $derived, $effect) when on Svelte 5.
- Keep components small and focused.
- Type check: `svelte-check`

### Go
- Use `gofmt` for formatting, `golangci-lint` for linting if configured.
- Follow effective Go conventions. Use standard library when possible.
- Tests alongside source files with `_test.go` suffix.

### CSS / Styling
- Prefer the project's existing approach (Tailwind, CSS modules, vanilla).
- Never introduce a new CSS framework without asking.

## Tool Usage
- When researching docs or APIs, prefer using `web_search` and `web_fetch`.
- When looking for code examples from open source projects, search GitHub.
- When a web search is needed, use `web_search` or `web_fetch`.

## Commands Reference
Key commands to know across project types:
- Python: `uv run pytest`, `ruff check .`, `ruff format .`, `uv run mypy .`
- Rust: `cargo test`, `cargo clippy -- -D warnings`, `cargo fmt -- --check`
- TypeScript: `bun test` / `npm test`, `tsc --noEmit`, lint per project setup
- Go: `go test ./...`, `gofmt -l .`, `go vet ./...`
- Svelte: `svelte-check`, `vite build`
- Astro: `astro check`, `astro build`

## File Editing
- Use targeted edits for precise changes, full writes for new files.
- Read the file first before editing — never guess the current content.
- When editing, match the exact indentation (tabs vs spaces) of the existing file.
