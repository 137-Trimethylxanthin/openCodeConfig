---
description: Use only when a large diff introduces new abstraction layers, broad refactoring, or duplicated mechanisms.
mode: subagent
hidden: true
model: openai/gpt-5.6-luna
variant: high
reasoningEffort: high
reasoningSummary: auto
textVerbosity: low
steps: 6
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
Review an already substantial change for avoidable abstractions, duplicated mechanisms, speculative generality, and scope larger than required. Recommend simplifications without sacrificing correctness.
