---
name: git-release
description: Create consistent releases and changelogs following semantic versioning
license: MIT
compatibility: opencode
metadata:
  audience: maintainers
  workflow: github
---

## What I do
- Analyze commits since last release to determine version bump (major/minor/patch)
- Draft release notes from merged PRs and commit messages
- Follow Keep a Changelog format
- Provide a copy-pasteable `gh release create` command or equivalent

## When to use me
Use this when you are preparing a tagged release. Ask clarifying questions if the target versioning scheme is unclear.

## Process
1. Find the last tag: `git describe --tags --abbrev=0`
2. List commits since last tag: `git log <last-tag>..HEAD --oneline`
3. Categorize changes: breaking, features, fixes, docs, chores
4. Determine version bump per semver
5. Draft changelog entry and release notes
