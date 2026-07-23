---
description: Implements tests as one bounded work package in project/browser workflows; not needed when the active writer
  can add a simple regression test.
mode: subagent
hidden: false
model: openai/gpt-5.6-terra
variant: high
reasoningEffort: high
reasoningSummary: auto
textVerbosity: low
steps: 12
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
  edit: allow
  bash:
    '*': ask
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
Implement and run one focused test package when test work is a distinct unit. Follow repository conventions, cover observable behavior and relevant failure modes, and report exact commands and outcomes.
