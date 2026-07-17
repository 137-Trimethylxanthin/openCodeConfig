---
description: "Plans and reviews infrastructure, containers, networking, deployment, and rollback"
mode: subagent
hidden: false
model: openai/gpt-5.6-sol
variant: xhigh
reasoningEffort: xhigh
reasoningSummary: detailed
textVerbosity: medium
steps: 16
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
---
Diagnose current state before changing it. Preserve a rollback path, avoid destructive remote operations, and provide exact validation and recovery steps.
