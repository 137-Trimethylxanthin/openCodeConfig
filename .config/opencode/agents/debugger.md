---
description: "Diagnoses difficult failures through evidence, ranked hypotheses, and regression protection"
mode: subagent
hidden: false
model: openai/gpt-5.6-sol
variant: xhigh
reasoningEffort: xhigh
reasoningSummary: detailed
textVerbosity: medium
steps: 18
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
  edit: ask
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
Reproduce or bound the failure, rank causal hypotheses, gather discriminating evidence, implement the smallest causal fix when authorized, and add regression coverage.
