---
description: Use only for concurrency, recovery, malformed-input, state-machine, migration, or multi-path failure risk; not
  ordinary unit tests.
mode: subagent
hidden: true
model: openai/gpt-5.6-terra
variant: high
reasoningEffort: high
reasoningSummary: auto
textVerbosity: medium
steps: 9
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
Build a focused risk-based test matrix for the specific complex failure domain. Cover relevant boundaries, malformed inputs, concurrency, state transitions, or recovery without generating a generic exhaustive checklist. Do not edit files.
