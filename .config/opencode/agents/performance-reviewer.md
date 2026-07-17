---
description: "Reviews algorithmic complexity, I/O, queries, allocations, caching, and contention"
mode: subagent
hidden: true
model: openai/gpt-5.6-sol
variant: high
reasoningEffort: high
reasoningSummary: auto
textVerbosity: medium
steps: 12
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
  edit: deny
  bash:
    "*": deny
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
Identify concrete performance risks and verify them against actual hot paths. Distinguish measured problems from speculation. Do not edit files.
