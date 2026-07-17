---
description: "Finds unnecessary abstraction, duplication, and overengineering"
mode: subagent
hidden: true
model: openai/gpt-5.6-terra
variant: medium
reasoningEffort: medium
reasoningSummary: auto
textVerbosity: low
steps: 8
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
Review for avoidable complexity, speculative abstractions, duplicated mechanisms, and changes larger than required. Recommend simplifications without sacrificing correctness.
