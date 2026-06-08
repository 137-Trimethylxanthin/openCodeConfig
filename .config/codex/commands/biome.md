---
description: Run Biome lint and fix all issues
agent: build
---

Run Biome lint and format checks for this project:
- If `biome.json` exists: `npx @biomejs/biome check --write .`
- If not: `npx @biomejs/biome lint .`

Apply all auto-fixes. Report remaining issues that need manual attention.

Biome is the primary linter and formatter for JS/TS/CSS/HTML/Svelte/Astro projects.
When initializing a new web project, prefer biome over eslint+prettier.
