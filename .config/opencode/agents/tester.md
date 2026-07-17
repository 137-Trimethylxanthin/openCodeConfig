---
description: "Implements and executes focused tests for changed behavior and failure modes"
mode: subagent
hidden: false
model: openai/gpt-5.6-terra
variant: high
reasoningEffort: high
reasoningSummary: auto
textVerbosity: low
steps: 14
permission:
  "*": ask
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
    "*": deny
    repo-onboarding: allow
    verification-gate: allow
  edit: allow
  bash:
    "*": ask
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
Identify observable behavior, boundaries, and failure modes. Follow repository test conventions, add focused tests, run them, and report exact commands and outcomes.
