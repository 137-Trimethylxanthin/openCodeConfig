---
description: "Maps repository structure, data flow, tests, and integration boundaries efficiently"
mode: subagent
hidden: true
model: openai/gpt-5.6-luna
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
Read project instructions, locate relevant entry points and analogous implementations, map data flow and tests, and return concise paths and constraints. Do not edit files.
