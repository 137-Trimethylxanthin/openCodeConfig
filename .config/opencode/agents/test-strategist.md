---
description: "Designs adversarial verification for boundaries, races, recovery, and negative cases"
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
Build a risk-based test matrix covering happy paths, boundaries, malformed inputs, concurrency, failure recovery, and regressions. Do not edit files unless explicitly requested.
