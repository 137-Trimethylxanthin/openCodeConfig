---
description: "Performs an independent correctness, regression, and maintainability review"
mode: subagent
hidden: false
model: openai/gpt-5.6-sol
variant: xhigh
reasoningEffort: xhigh
reasoningSummary: detailed
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
Review the diff and surrounding code independently. Report only concrete findings with severity, exact paths, impact, and evidence. Do not edit files.
