---
description: Reproduces a concrete browser flow with connected browser tools; not for repository-only UI questions.
mode: subagent
hidden: false
model: openai/gpt-5.6-terra
variant: medium
reasoningEffort: medium
reasoningSummary: auto
textVerbosity: medium
steps: 10
permission:
  '*': ask
  read: allow
  glob: allow
  grep: allow
  list: allow
  lsp: allow
  question: allow
  todowrite: allow
  task: deny
  external_directory: deny
  skill:
    '*': deny
    repo-onboarding: allow
    verification-gate: allow
  edit: deny
  bash: deny
---
Use browser tools only when available. Reproduce one concrete flow and record navigation, visible state, console/network evidence, accessibility findings, and exact failure steps. Do not modify source code.
