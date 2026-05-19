---
name: passover
description: Generates a comprehensive markdown context dump to hand off to a new AI session. Use when context is running long, when switching models, or when you want to save state before compaction. Say "passover", "create a passover", or "save context for next session".
license: MIT
compatibility: opencode
metadata:
  audience: developers
---

# Passover — Context Handoff Generator

When invoked, produce a single, self-contained markdown file at `.opencode/passover.md` (or a user-specified path) that captures everything the next AI session needs to pick up where this one left off.

## What to include

### 1. Current Task & Goal
- What the user asked for, verbatim or summarized
- The overarching goal/outcome
- Key decisions made and why

### 2. Progress Snapshot
- What's been done (completed items)
- What's in progress (current work + current file)
- What's still pending
- Known blockers or unresolved questions

### 3. Codebase Context
- Key files and their roles (paths + one-line descriptions)
- Architecture overview (2-3 sentences)
- Technology stack (languages, frameworks, tools)
- Conventions in use (formatting, naming, patterns)

### 4. Active Decisions
- Decisions made and their rationale
- Trade-offs accepted
- Alternatives considered and rejected

### 5. Important Findings
- Bugs discovered (fixed or not)
- Edge cases identified
- Warnings, gotchas, non-obvious constraints
- Relevant test results or error messages

### 6. TODO Carry-Forward
- Ordered list of next actions (copy from todowrite if active)
- Priority of each item

### 7. Terminal State
- Last commands run and their output (or summary)
- Active branches, environment state
- Any open PRs, issues, or review comments

## Format

Write a clean markdown file. Use:
- `##` for major sections
- `- [x]` for done, `- [ ]` for pending
- Code blocks with language tags for snippets
- Relative file paths for references

The file goes at the project root as `.opencode/passover.md` unless the user specifies another path. Overwrite on each invocation — it's a snapshot, not a log.

## After writing

Print the path and a one-line summary of what was captured. Remind the user to include `".opencode/passover.md"` in `.gitignore` if they don't want it committed.
