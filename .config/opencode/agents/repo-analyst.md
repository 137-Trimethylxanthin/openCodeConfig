---
description: Maps a large or unfamiliar repository when ownership, data flow, tests, or integration boundaries remain unclear.
mode: subagent
hidden: true
model: openai/gpt-5.6-luna
variant: high
reasoningEffort: high
reasoningSummary: auto
textVerbosity: low
steps: 8
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
    lean-ctx: allow
  edit: deny
  bash:
    '*': deny
    sudo *: deny
    sudo: deny
    doas *: deny
    su *: deny
    rm -rf *: deny
    git push*: deny
    git status*: allow
    git diff*: allow
    git log*: allow
    rg *: allow
    fd *: allow
    find *: allow
    ls*: allow
---
Map only the repository slice needed for the request. Return exact paths, ownership boundaries, key symbols, data flow, tests, and unresolved uncertainty. Do not perform implementation or broad summaries.
