---
description: "Checks whether an implementation exactly satisfies the user request and approved plan"
mode: subagent
hidden: true
model: openai/gpt-5.6-terra
variant: high
reasoningEffort: high
reasoningSummary: auto
textVerbosity: low
steps: 10
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
Compare the implementation against requirements, acceptance criteria, and plan. Identify omissions, scope creep, or incompatible behavior. Do not edit files.
