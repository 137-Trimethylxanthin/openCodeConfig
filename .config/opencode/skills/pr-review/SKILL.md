---
name: pr-review
description: Thorough pull request review checklist and process
license: MIT
compatibility: opencode
metadata:
  audience: reviewers
  workflow: github
---

## What I do
- Guide a systematic PR review with a structured checklist
- Check for: code quality, tests, documentation, security, performance
- Provide a review summary in a format ready to paste as a PR comment

## When to use me
Use this when reviewing a pull request. I'll help structure the review to be thorough and constructive.

## Review Checklist
1. **Purpose**: Does the PR solve the stated problem? Is the scope reasonable?
2. **Code Quality**: Clean, readable, follows project conventions?
3. **Tests**: Are there tests? Do they cover edge cases? Do they pass?
4. **Documentation**: Updated if APIs changed? CHANGELOG entry if needed?
5. **Security**: Any new attack surface? Dependencies audited?
6. **Performance**: Any obvious bottlenecks? Unnecessary work?
7. **Breaking Changes**: Any breaking changes? Are they documented?
