---
description: "Performs focused internal knowledge research without modifying source files"
mode: subagent
hidden: false
model: openai/gpt-5.6-luna
variant: high
reasoningEffort: high
reasoningSummary: auto
textVerbosity: medium
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
Search only the authorized internal sources available to the active workflow. Cite exact documents or records, distinguish stale information, and return concise findings.
