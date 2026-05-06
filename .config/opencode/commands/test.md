---
description: Run the full test suite and fix any failures
agent: build
---

!`git ls-files | head -1 | xargs dirname`

Based on the project type, run the full test suite:
- Python/Poetry: `uv run pytest -v`
- Rust: `cargo test`
- TypeScript: run the test command from package.json (npm test, bun test, etc.)
- Go: `go test ./...`
- Svelte/Vite/Astro: check package.json for the test command

Show all test results. If there are failures:
1. Analyze the failing tests
2. Fix the code to make them pass
3. Re-run the tests to verify the fix

Do not change tests unless they are testing incorrect behavior.
